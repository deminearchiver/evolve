> [!WARNING] This branch, `next`, is a working draft of the next major version of this library. Breaking changes are to be expected with each new commit.

> [!IMPORTANT] Below are (mostly) up-to-date instructions on how to properly set up this library, as well as some basic information. Both the guides and the info may be inaccurate or outdated.

> [!NOTE] For now, workspace member packages do not have README files of their own, so kindly refer to this one for any information.

# Material for Flutter

<details>
  <summary>
    <h3>Table of contents</h3>
  </summary>

- [Material for Flutter](#material-for-flutter)
  - [Packages](#packages)
    - [`mcu`](#mcu)
      - [Installation](#installation)
    - [`material3`](#material3)
    - [`material3_expressive`](#material3_expressive)
      - [Installation](#installation-1)
  - [Apps](#apps)
    - [mtb](#mtb)
      - [Installation](#installation-2)
        - [Building from source](#building-from-source)
        - [Installing globally](#installing-globally)
        - [Download a prebuilt binary](#download-a-prebuilt-binary)
      - [Usage](#usage)

</details>

## Packages


### `mcu`

> [!CAUTION] Package name may change in the near future.

This package is a Dart port of the recently updated [Material Color Utilities] (the Dart version of which is now outdated).

#### Installation

1. Add this to `pubspec.yaml`:

    ```yaml
    dependency_overrides:
      mcu:
        git:
          url: git@github.com:deminearchiver/evolve.git
          ref: next
          path: packages/mcu
    ```

2. Now you can add the package in your `pubspec.yaml`:

    ```yaml
    dependencies:
      mcu: # This gets overriden
    ```

### `material3`

TBA.

### `material3_expressive`

#### Installation

1. Add this to `pubspec.yaml`:

    ```yaml
    dependency_overrides:
      mcu:
        git:
          url: git@github.com:deminearchiver/evolve.git
          ref: next
          path: packages/mcu
      material3_expressive:
        git:
          url: git@github.com:deminearchiver/evolve.git
          ref: next
          path: packages/material3_expressive
    ```

2. Now you can add the package in your `pubspec.yaml`:

    ```yaml
    dependencies:
      material3_expressive: # This gets overriden
    ```

## Apps

### mtb

`mtb` is short for "Material Theme Builder". This app is the unofficial CLI counterpart of the web-based official Material Theme Builder app.

#### Installation

##### Building from source

1. Clone this repository:
   
    ```sh
    git clone -b next https://github.com/deminearchiver/evolve.git
    ```

2. Install workspace dependencies:
   
    ```sh
    flutter pub get
    ```

3. Switch to the `apps/mtb` directory:
 
    ```sh
    cd apps/mtb
    ```

4. Install app dependencies:
   
    ```sh
    dart pub get
    ```

5. Compile to an executable:
   
    ```sh
    dart compile exe bin/mtb.dart
    ```

##### Installing globally

1. Clone this repository:
   
    ```sh
    git clone -b next https://github.com/deminearchiver/evolve.git
    ```

2. Install workspace dependencies:
   
    ```sh
    flutter pub get
    ```

3. Switch to the `apps/mtb` directory:
 
    ```sh
    cd apps/mtb
    ```

4. Install app dependencies:
   
    ```sh
    dart pub get
    ```

5. Install globally:
   
   ```sh
   dart pub global activate --source path .
   ```

##### Download a prebuilt binary

A prebuilt binary ~~should~~ be available on the [Actions](https://github.com/deminearchiver/evolve/actions) page.


#### Usage

```sh
mtb create
```
