import React from "react";
import * as textEditor from "@modelix/projectional-editor-ssr-client-lib";
import "./ModelixTextEditor.css";

interface ModelixTextFieldProps {
    nodeRef: string
}

export class ModelixTextEditor extends React.Component<ModelixTextFieldProps> {

    private element: HTMLDivElement | null = null

    render() {
        return <div ref={(el) => this.element = el} className="modelix-text-editor" />;
    }

    componentDidMount() {
        textEditor.org.modelix.editor.ssr.client.ClientSideEditorsAPI.createEditor(
            this.props.nodeRef,
            this.element,
            (targetNodeRef: string, rootNodeRef: string) => this.openInNewTab(targetNodeRef, rootNodeRef),
            selectedNodeFromUrl()
        )
    }

    /**
     * Cmd/Ctrl+click on a reference to a node of a different root node. The page shows one root node, so the target
     * is opened in a new browser tab instead of replacing the content of this editor.
     *
     * Returns false if the page URL doesn't identify the node this editor shows, in which case the URL of the
     * target cannot be derived either and the editor falls back to opening the root node in place.
     */
    private openInNewTab(targetNodeRef: string, rootNodeRef: string): boolean {
        const url = this.urlOfNode(rootNodeRef)
        if (url === null) return false
        // The new tab opens the root node. The fragment tells its editor which node to put the selection on.
        url.hash = encodeURIComponent(targetNodeRef)
        return window.open(url.toString(), "_blank") !== null
    }

    /**
     * The URL of the current page with the node it shows replaced by the given one. The node is expected to be one
     * of the path segments (see the page's path in the MPS project), otherwise null is returned.
     */
    private urlOfNode(nodeRef: string): URL | null {
        const url = new URL(window.location.href)
        const segments = url.pathname.split("/")
        const index = segments.findIndex(segment => decodeURIComponent(segment) === this.props.nodeRef)
        if (index < 0) return null
        segments[index] = encodeURIComponent(nodeRef)
        url.pathname = segments.join("/")
        return url
    }
}

/**
 * The node that the editor is expected to select, written into the fragment by [openInNewTab].
 */
function selectedNodeFromUrl(): string | undefined {
    const hash = window.location.hash
    return hash.length > 1 ? decodeURIComponent(hash.substring(1)) : undefined
}
