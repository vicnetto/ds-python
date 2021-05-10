# **Spring Boot - React** -> Creating a sales website

How do these tools work? How to make a functional project with them, and where are they used?

First of all, Spring is a framework that provides a comprehensive programming and configuration model for modern Java-based enterprise applications. It was created by Rod Johnson, and it works based in two big project patterns: *dependency injection* and *inversion of control*.

The second framework, known as **React**, it's a *JavaScript* library that has a open-source code. It is focused on creating interfaces, in web pages. As an example of its magnitude, at the moment, this framework is commonly used on Facebook, Instagram, Neflix, Imgur, and so it goes.

## Should everyone know how there two frameworks?

It depends. They are used in different areas that complement each other. If you planning to be a *Fullstack Developer*, maybe it's a right choice to learn both of them.

## How to create a git repository with *backend* and *frontend*? 

By organisation, you should create two different folders in the project. One for the *front* side of the project, and the same for the *back*. 

## Initial tools

To start a project involving these two frameworks, some dependencies are needed, among them:

- **yarn** -- Build and dependency manager. Generally works as a project manager.

## Starting a *front-end* (React) project

To begin a new project, it is necessary to use the following code line, in the terminal (be sure you're in the right folder):

```shell

npx create-react-app {path} --template typescript

```

**This** code above, create a *React* project locally in your computer. As a parameter, it is possible to choose what kind of programming language you will use in your *React* project. **Typescript** (the one that we're currently using) is known as a *JavaScript* super set, implementing several other features to be used. 

If everything occurs as it should, some documents will be shown in the current repository. There documents are the basics to start a new *React* project. As this helps in the development of the project, some good programming practices will be injected on the project. An example is the .git folder, leaving everything ready to start a new git repository (totally optional).

## Continuing with the *backend*, starting a *Spring* project

To start a **Spring** application, it's recommended to use the [Spring Initializr](https://start.spring.io/) website. This website is a ready to use spring project creator. With just a few configurations, you should be ready to start a project.

OBS: It is possible to create projects without using this tool, but is recommended because this web page is originally from Spring, being a "official" way to create a new project.

In this case, we're going to use five different dependencies. Among them:

- Spring Web
- H2 Database
- PostgreSQL Driver
- Spring Data JPA
- Security

This is just a basic project, and this dependencies will be used in this exact application. Another application can use other dependencies as well, depending on what is it's their goal.
