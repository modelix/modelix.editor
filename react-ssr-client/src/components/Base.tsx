import React from 'react'
import {IViewModel} from "../ViewModel.ts";

export interface IComponent extends IComponentContainer {
    type: string
    key: string | undefined
    properties: object | undefined
}

export interface IComponentContainer {
    children: IComponentOrText[] | undefined
}

export interface IComponentOrText {
    component: IComponent | undefined
    text: string | undefined
}


export interface IComponentWrapper {
    component: IComponent
}

function jsonToProps(json: Record<string, any> | undefined): Record<string, any> | undefined {
    if (json === undefined) return json;

    let result = json;

    for (const key in json) {
        const value = json[key]
        if (typeof value == "object" && value != null) {
            if (typeof value.jsCode == "string") {
                const code = eval(value.jsCode);
                result = {
                    ...result,
                    [key]: code
                }
            } else if (typeof value.componentConstructor == "string") {
                const compName: string = value.componentConstructor;
                result = {
                    ...result,
                    [key]: componentConstructors.get(compName) ?? compName
                }
            } else if (typeof value.type == "string") {
                const comp = createComponentFromJson(value)
                result = {
                    ...result,
                    [key]: comp
                }
            } else {
                result = {
                    ...result,
                    [key]: jsonToProps(value)
                }
            }
        }
    }

    return result
}

export function createComponentFromJson(component: IComponent | string): React.ReactNode {
    if (typeof component == "string") {
        return component
    } else {
        const renderer = componentConstructors.get(component.type);
        if (renderer) {
            let convertedProps = jsonToProps(component.properties) ?? {}
            return React.createElement(renderer, { ...convertedProps, key: component.key }, ...renderChildComponents(component))
        } else {
            return (<span>Unknown component type: "{component.type}"</span>);
        }
    }
}

function renderChildComponents(parent: IComponentContainer): React.ReactNode[] {
    if (parent.children) {
        return parent.children.map(componentData => createComponentFromJson(componentData.component ?? componentData.text!!));
    } else {
        return [];
    }
}

export function renderViewModel(model: IViewModel) {
    return <div>{renderChildComponents(model)}</div>
}

export const componentConstructors: Map<string, any> = new Map();

export function registerComponentConstructor(type: string, ctor: any) {
    componentConstructors.set(type, ctor)
}
