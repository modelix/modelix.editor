const IMAGE_EDITOR_PORT = 43596;

export function getWebsocketBaseUrl(nodeRef: string) {
    let url: string
    if(window.location.protocol == "https:") {
        url = "wss://";
    } else  {
        url = "ws://";
    }
    const path = `nodes/${encodeURIComponent(nodeRef)}/image-editor/ws`;
    // Behind the proxy of a workspace instance, which forwards `.../port/<port>/...` to that port of the instance,
    // other ports aren't reachable directly. The image editor server is then addressed by its port in the path.
    const proxyPathPrefix = /^(.*?\/port\/)[0-9]+\//.exec(window.location.pathname)?.[1];
    if (proxyPathPrefix === undefined) {
        url += `${window.location.hostname}:${IMAGE_EDITOR_PORT}/${path}`;
    } else {
        url += `${window.location.host}${proxyPathPrefix}${IMAGE_EDITOR_PORT}/${path}`;
    }
    return url;
}
