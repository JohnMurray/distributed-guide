# Distributed Guide

This is a guide that I am building (likely for quite some time) while I go down
the deep, deep rabbit hole that is distributed computation. This guide is still
very much a work in progress and has no viewable form beyond the code in this
repository. Please check back soon for something easily viewable.

## Editing

I've used a bit of a mashup of home-grown templating to allow me to do exactly what I need to
generate/build the book in different formats. As such, it's worth taking just a _little_ time to
explain what those temlating methods are.

__File Includes__ \\
To include a file, simply use

```
<#! file-name.html #!>
```

The file-name is assumed to come from the `includes` folder.

__Template Files__ \\
To define a file that should be used as a template, simply write an HTML file (no markdown for templates)
and somehwere within the template add

```
<#!+ include +!#>
```

This will be macro-style replaced with the content of the file that is using the template.

__Using A Template__ \\
To use a template, simply start the file with

```
<#!! book/template.html !!#>

--CONTENT--
```

The first line indicates the template to use (the path is relative to the root of the project)
and the `--CONTENT--` bit signifies the end of the '_header_' section and the beginning of the
content to render inside of the template.


## developing

To start a dev-site just run

```
rake dev
```

This will start up Guard to auto-build the application as you make edits and will start a puma
server on [localhost:9292](http://localhost:9292/).

## Building

The application can be build using the Makefile (not really, but soon!) and you will
most certainly need to have [`pandoc`][1] installed.

## Contributing

I would love to take contributions on this project. However currently it's severely lacking in overall content
so I won't be taking contributions until I'm a little more finished.

__ToDo's__

A list of todo's that I am currently working through.

- [ ] Special styling for key-definitions
- [ ] Re-organize introduction to cover basic topics (distributed programming, nodes, partition, replicas, etc.)
- [ ] Render single-page HTML version


  [1]: http://pandoc.org/
