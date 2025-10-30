import {componentConstructors, registerComponentConstructor} from "./Base.tsx";
import * as mui from "@mui/material";
import * as icons from "@mui/icons-material";
import * as joy from "@mui/joy";
import * as joyStyles from "@mui/joy/styles";
import * as antd from "antd";
import * as primeComponents from "./PrimeReactComponents.ts";
import * as primeIcons from "./PrimeReactIcons.ts";
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

function registerAllComponents(objects: any, prefix: string) {
    for (const id in objects) {
        if (id.charAt(0).toUpperCase() != id.charAt(0)) continue
        registerComponentConstructor(prefix + id, (objects as any)[id])
    }
}

export function registerDefaultComponents() {
    for (const tagName of htmlTagList) {
        registerComponentConstructor("html." + tagName, tagName)
    }

    for (const tagName of svgTagList) {
        registerComponentConstructor("svg." + tagName, tagName)
    }

    registerAllComponents(mui, "mui.")
    registerAllComponents(icons, "mui.icons.")
    registerAllComponents(joy, "joy.")
    registerAllComponents(joyStyles, "joy.styles.")
    registerAllComponents(antd, "antd.")
    registerAllComponents(primeComponents, "primereact.")
    registerAllComponents(primeIcons, "primereact.icons.")

    registerComponentConstructor("mui.DataGrid", DataGrid)
    registerComponentConstructor("mui.Grid2", Grid2)
    registerComponentConstructor("mui.SimpleTreeView", SimpleTreeView)
    registerComponentConstructor("mui.RichTreeView", RichTreeView)
    registerComponentConstructor("mui.TreeItem", TreeItem)
    registerComponentConstructor("mui.TreeItem2", TreeItem2)
    registerComponentConstructor("modelix.Dropdown", Dropdown)
    registerComponentConstructor("modelix.ReferenceTargetChooser", ReferenceTargetChooser)
    registerComponentConstructor("modelix.TextField", ModelixTextField)
    registerComponentConstructor("modelix.Spreadsheet", ModelixSpreadsheet)
    registerComponentConstructor("modelix.TextEditor", ModelixTextEditor)
    registerComponentConstructor("modelix.ImageBasedEditor", ModelixImageBasedEditor)

    const xhr = new XMLHttpRequest();
    xhr.open("POST", window.location.origin + window.location.pathname + "../../../known-components", true);
    xhr.setRequestHeader('Content-Type', 'text/plain');
    xhr.send(Array.from(componentConstructors.keys()).join("\n"));
}
