# modelix.editor

This project contains MPS plugins and languages for adding web based editors to your languages.

# Installation

Download the latest version of the `all-editor-plugins.zip` from
https://artifacts.itemis.cloud/service/rest/repository/browse/maven-mps/org/modelix/all-editor-plugins/
and unzip it into your MPS plugins folder.

The plugins folder is usually located at
- MacOS: `<HOME>/Library/Application Support/JetBrains/MPS<version>/plugins/`
- Windows: `<HOME>\AppData\Roaming\JetBrains\MPS<version>\plugins`
- Linux: `<HOME>/.local/share/JetBrains/MPS<version>/plugins`

See also https://www.jetbrains.com/help/idea/directories-used-by-the-ide-to-store-settings-caches-plugins-and-logs.html#plugins-directory

You may have to create the plugins folder if it doesn't exist yet.

Currently, these MPS versions are supported: 2023.2, 2023.3, 2024.1

# Usage

## Projectional text editor

Open http://localhost:43593/ and navigate to some model containing baseLanguage code.

Modelix already contains an editor definition for some baseLanguage concepts.
If you open a model containing instances of your own languages,
a default reflective syntax is used for unknown concepts.

You can look at the module `org.modelix.mps.notation.impl.baseLanguage` to learn how to define the concrete syntax
for your concepts.
Similar to a plugin solution, you have to create a special model named `<module name>.modelix`.
The solution has to be configured similar to a plugin solution to allow MPS loading classes from it
(see https://www.jetbrains.com/help/mps/plugin.html).

## React based UI (experimental)

Select any node in MPS then hit CMD+shift+A and choose the action "Open Node in Web Editor".
A new tab will open in MPS showing an embedded browser that renders your node with react components.

You can define a custom editor also in the special `modelix` model using the language `org.modelix.mps.react`.

# Development

During development on this project you can run the `installMpsDevPlugins` task
to build and install only those plugins that don't contain any MPS modules.
Then open the project in the `mps` folder with MPS to load and edit the MPS modules. 
