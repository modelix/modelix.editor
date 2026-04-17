import {Component, SetStateAction, useState} from 'react'
import './App.css'
import {IViewModel} from "./ViewModel.ts";
import {IComponent, IComponentOrText, renderViewModel} from "./components/Base.tsx";
import {registerDefaultComponents} from "./components/DefaultComponents.ts";
import {getWebsocketBaseUrl, getWebsocketUrl} from "./main.tsx";
import ReconnectingWebSocket from "reconnecting-websocket";
import {useLocation} from "react-router";

registerDefaultComponents();

const initialModel: IViewModel = {
    children: [
        {
            component: {
                type: "html.div",
                key: "c1",
                properties: {
                    style: {
                        fontStyle: "italic"
                    }
                },
                children: [{text: "Loading ..."}]
            } as IComponent
        } as IComponentOrText
    ]
}

function App() {
    const location = useLocation();
    const relativePath = location.pathname.substring(1);
    return <ModelixReactClient websocketRelativeUrl={relativePath} />
}

class ModelixReactClient extends Component<{websocketRelativeUrl: string}, { model: IViewModel }> {
    private activeUrl: string | null = null;
    private websocket: ReconnectingWebSocket | undefined;

    constructor(props: {websocketRelativeUrl: string}) {
        super(props);
        this.state = {
            model: initialModel
        }
    }

    render() {
        try {
            if (this.activeUrl !== null && this.props.websocketRelativeUrl !== this.activeUrl) {
                this.websocket?.send(JSON.stringify({urlPath: this.props.websocketRelativeUrl}));
                this.activeUrl = this.props.websocketRelativeUrl;
            }
            return renderViewModel(this.state.model)
        } catch (ex: any) {
            return <pre>{"" + ex}</pre>
        }
    }

    private connect() {
        this.websocket = new ReconnectingWebSocket(getWebsocketBaseUrl() + this.props.websocketRelativeUrl, [], {
            maxReconnectionDelay: 5000,
            minReconnectionDelay: 100,
            maxEnqueuedMessages: 0
        })
        this.activeUrl = this.props.websocketRelativeUrl;
        this.websocket.addEventListener("message", event => {
            const json = JSON.parse(event.data)
            console.log("Message from server ", json);
            this.setState({ model: json.viewModel })

        });
        if ((window as any).modelix === undefined) {
            (window as any).modelix = {}
        }
        (window as any).modelix.sendMessage = (message: any) => this.websocket?.send(JSON.stringify(message))
    }

    private disconnect() {
        if (this.websocket) {
            this.websocket.close();
            this.websocket = undefined;
            this.activeUrl = null;
        }
    }

    componentDidMount() {
        this.connect();
    }

    componentWillUnmount() {
        this.disconnect()
    }
}

export default App
