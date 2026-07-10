# Rails Bootstrap UI

This is the source code of railsbootstrapui.com.

Rails Bootstrap UI is a UI framework for Ruby On Rails, based on Bootstrap.

What does this library do:
* Edits some default Bootstrap variables to make all bootstrap components look more modern.
* Gives more examples of how to combine existing Bootstrap classes to create new components.
* Adds animations
* Adds some new components that are not present in Bootstrap 
* Show examples on how to use these components in your Turbo-powered Rails app. This means that we will use Stimulus controllers to attach javascript behavior to our components.

## Development principles

* Ruby On Rails: we don't aim to make this UI framework work without Rails. It's Rails-specific.
* Bootstrap: we want to use Bootstrap as the base for our components. There are many other UI Frameworks based on Tailwind out there: this is a Bootstrap one.
* SCSS: sass is a dependency of this project. We will strive to use pure CSS whenever this is possible.
* Rails-frontend agnostic: we don't want any dependency over ViewComponent or Phlex or other libraries, although we ❤️ them. We might still use those to provide some integration examples, but they are not a requirement.
* Hotwire-ready: we will use stimulus controllers to attach javascript behavior to our components. Stimulus is our guarantee that each component is hotwire-ready. 

## What do you get with Rails Bootstrap UI

At the moment this is a Website (https://railsbootstrapui.com) that shows you how to use the components. You can easily copy-paste the code to your app or take inspiration.

We would like, in the future, to also provide a rails-bootstrap-ui gem that you can bundle.
When you bundle rails-bootstrap-ui you get a bunch of SCSS files and stimulus controllers that you can use in your app to build your UI components.
The gem will also add Lookbook to your app, so that you can customize your layout and see the results on all the components.

## Dependencies
* We don't want any hard-dependency on the gem itself. You should not be forced to include libraries that you don't want to use. This means that:
  * Lookbook is not included by default, but it's a separate gem. Install `rails-bootstrap-ui-lookbook` if you want to preview components in your app.
  * Bootstrap is not included by default as a gem. You can decide yourself if you want to use sprockets or css-bundling to include it in your app.
  * Stimulus is not included by default. You can decide yourself if you want to use it in your app.
  * ViewComponent is not included by default. You can decide yourself if you want to use it in your app.
  * No scss compiler is included by default.

This is just a wishful thinking for now and a plan. There's no gem available just yet.

## Installation (not ready yet)

```bash
bundle add rails-bootstrap-ui
```

## Usage

We have no idea yet. We are still working on this.

## Contributing

Bug reports and pull requests are very much welcome. Please check our [plan](https://github.com/orgs/renuo/projects/7) to see what components we would like to add.

If you want to add a new component, run `bin/rails g ui_component my_component_name` and follow the instructions.

## Development

Please note that most of Rails Engines have been disabled by default since we didn't really need them yet.

## License

Everything is released with an [MIT License](https://opensource.org/licenses/MIT).
