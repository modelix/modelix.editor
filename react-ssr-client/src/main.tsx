import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import './index.css'
import {
    Column,
    ColumnGroup,
    ModelixSpreadsheet,
    ModelixSpreadsheetProperties
} from "./components/ModelixSpreadsheet.tsx";
import * as textEditor from "@modelix/projectional-editor-ssr-client-lib";


const spreadSheetModel: ModelixSpreadsheetProperties = {
    title: "Mitarbeiter",
    columns: [
        {
            label: "Name",
            columns: [
                {
                    name: "firstName",
                    label: "First"
                } as Column,
                {
                    name: "lastName",
                    label: "Last"
                } as Column,
            ]
        } as ColumnGroup,
        {
            name: "birthDate",
            label: "Birth Date"
        } as Column,
        {
            name: "age",
            label: "Age"
        } as Column
    ],
    rows: [
        {
            cells: {
                firstName: "Erika",
                lastName: "Musterfrau",
                age: "18"
            }
        },
        {
            cells: {
                firstName: "Max",
                lastName: "Mustermann",
                age: "24"
            }
        },
        {
            cells: {
                firstName: "Tom",
                lastName: "Fischer",
                age: "29"
            }
        },
    ]
}

textEditor.org.modelix.editor.ssr.client.ClientSideEditorsAPI.init()

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    {/*<ModelixSpreadsheet {...spreadSheetModel} />*/}
    <App />
  </React.StrictMode>,
)


export function getWebsocketBaseUrl() {
    let path = window.location.pathname;
    path = path.substring(0, path.lastIndexOf("/"));
    let url: string;
    if(window.location.protocol == "https:") {
        url = "wss://" + window.location.host + path;
    } else  {
        url = "ws://" + window.location.host + path;
    }

    for (let tag of document.getElementsByTagName("base")) {
        if (tag.href != "") {
            url = tag.href;
            if (url.toLowerCase().startsWith("http")) {
                // changes http to ws and https to wss
                url = "ws" + url.substring(4, url.length);
            }
            if (url.charAt(url.length - 1) == "/") {
                url = url.substring(0, url.length - 1);
            }
        }
    }
    url += "/";
    return url;
}

export function getWebsocketUrl() {
    const path = window.location.pathname;
    let url: string;
    if(window.location.protocol == "https:") {
        url = "wss://" + window.location.host + path;
    } else  {
        url = "ws://" + window.location.host + path;
    }
    return url;
}

