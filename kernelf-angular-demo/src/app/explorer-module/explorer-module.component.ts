import {Component, Input, OnInit} from '@angular/core';
import { org, Nullable } from 'kernelf-editor';

@Component({
  selector: 'app-explorer-module',
  templateUrl: './explorer-module.component.html',
  styleUrls: ['./explorer-module.component.scss']
})
export class ExplorerModuleComponent implements OnInit {

  @Input()
  public node!: org.modelix.model.repositoryconcepts.N_Module;

  constructor() {

  }

  public getModels(): Array<org.modelix.model.repositoryconcepts.N_Model> {
    let modelsArray = this.node.models.asArray();
    console.log("Models: " + modelsArray)
    console.log("Num Models: " + this.node.models.getSize())
    return modelsArray
  }

  public getName(): Nullable<string> {
    try {
      throw Error(".name")
    } catch (e) {
      console.log(e)
    }
    let name = this.node.name;
    console.log("Module name: " + name)
    return name
  }

  ngOnInit(): void {
  }

}
