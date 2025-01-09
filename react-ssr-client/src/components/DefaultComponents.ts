import {componentConstructors, IComponentWrapper, registerComponentConstructor} from "./Base.tsx";
import * as mui from "@mui/material";
import * as icons from "@mui/icons-material";
import {GenericComponent} from "./GenericComponent.tsx";
import { DataGrid } from '@mui/x-data-grid';
import Grid2 from "@mui/material/Unstable_Grid2"
import { SimpleTreeView, RichTreeView, TreeItem, TreeItem2 } from '@mui/x-tree-view';
import {ReferenceTargetChooser} from "./ReferenceTargetChooser.tsx";
import {Dropdown} from "./Dropdown.tsx";
import {ModelixTextField} from "./ModelixTextField.tsx";
import {ModelixSpreadsheet} from "./ModelixSpreadsheet.tsx";
import {ModelixTextEditor} from "./ModelixTextEditor.tsx";
import {ModelixImageBasedEditor} from "./image-editor/ModelixImageBasedEditor.tsx";

const htmlTagList = [
    "a", "abbr", "address", "area", "article", "aside", "audio",
    "b", "base", "bdi", "bdo", "big", "blockquote", "body", "br", "button",
    "canvas", "caption", "center", "cite", "code", "col", "colgroup",
    "data", "datalist", "dd", "del", "details", "dfn", "dialog", "div", "dl", "dt",
    "em", "embed",
    "fieldset", "figcaption", "figure", "footer", "form",
    "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", "hgroup", "hr", "html",
    "i", "iframe", "img", "input", "ins",
    "kbd", "keygen",
    "label", "legend", "li", "link",
    "main", "map", "mark", "menu", "menuitem", "meta", "meter",
    "nav", "noindex", "noscript",
    "object", "ol", "optgroup", "option", "output",
    "p", "param", "picture", "pre", "progress",
    "q",
    "rp", "rt", "ruby",
    "s", "samp", "search", "slot", "script", "section", "select", "small", "source", "span", "strong", "style", "sub", "summary", "sup",
    "table", "template", "tbody", "td", "textarea", "tfoot", "th", "thead", "time", "title", "tr", "track",
    "u", "ul",
    "var", "video",
    "wbr", "webview"
]
const svgTagList = [
    "svg",
    "animate", "animateMotion", "animateTransform",
    "circle", "clipPath",
    "defs", "desc",
    "ellipse",
    "feBlend", "feColorMatrix", "feComponentTransfer", "feComposite", "feConvolveMatrix", "feDiffuseLighting",
    "feDisplacementMap", "feDistantLight", "feDropShadow", "feFlood", "feFuncA", "feFuncB", "feFuncG", "feFuncR",
    "feGaussianBlur", "feImage", "feMerge", "feMergeNode", "feMorphology", "feOffset", "fePointLight",
    "feSpecularLighting", "feSpotLight", "feTile", "feTurbulence",
    "filter", "foreignObject",
    "g",
    "image",
    "line", "linearGradient",
    "marker", "mask", "metadata", "mpath",
    "path", "pattern", "polygon", "polyline",
    "radialGradient", "rect",
    "set", "stop", "switch", "symbol",
    "text", "textPath", "tspan",
    "use",
    "view",
]

export function registerGenericComponent(id: string, elementType: any) {
    registerComponentConstructor(id, class extends GenericComponent {
        constructor(props: IComponentWrapper) {
            super(elementType, props);
        }
    });
}

export function registerDefaultComponents() {
    for (const tagName of htmlTagList) {
        registerGenericComponent("html." + tagName, tagName)
    }

    for (const tagName of svgTagList) {
        registerGenericComponent("svg." + tagName, tagName)
    }

    for (const id in mui) {
        if (id.charAt(0).toUpperCase() != id.charAt(0)) continue
        registerGenericComponent("mui." + id, (mui as any)[id])
    }

    for (const id in icons) {
        if (id.charAt(0).toUpperCase() != id.charAt(0)) continue
        registerGenericComponent("mui.icons." + id, (icons as any)[id])
    }

    registerGenericComponent("mui.DataGrid", DataGrid)
    registerGenericComponent("mui.Grid2", Grid2)
    registerGenericComponent("mui.SimpleTreeView", SimpleTreeView)
    registerGenericComponent("mui.RichTreeView", RichTreeView)
    registerGenericComponent("mui.TreeItem", TreeItem)
    registerGenericComponent("mui.TreeItem2", TreeItem2)
    registerGenericComponent("modelix.Dropdown", Dropdown)
    registerGenericComponent("modelix.ReferenceTargetChooser", ReferenceTargetChooser)
    registerGenericComponent("modelix.TextField", ModelixTextField)
    registerGenericComponent("modelix.Spreadsheet", ModelixSpreadsheet)
    registerGenericComponent("modelix.TextEditor", ModelixTextEditor)
    registerGenericComponent("modelix.ImageBasedEditor", ModelixImageBasedEditor)

    const xhr = new XMLHttpRequest();
    xhr.open("POST", window.location + "../../../known-components", true);
    xhr.setRequestHeader('Content-Type', 'text/plain');
    xhr.send(Array.from(componentConstructors.keys()).join("\n"));
}
