# Contributing to QueueFlex

Please take a moment to review this document in order to make the contribution process easy and effective for everyone involved! Also make sure you read our [Code of Conduct](CODE_OF_CONDUCT.md) that outlines our commitment towards an open and welcoming environment.

## Local development

Once you have a checkout of this repository, there are a few steps necessary to setup for local development of the application:

1. Install Erlang and Elixir. We recommend using Homebrew to do this on OS X. The versions we depend on can be found in `elixir_buildpack.config`.
2. Fetch and compile the application's dependencies: `mix do deps.get, deps.compile`
3. Run the test suite: `mix test`
4. Start up the server with a console: `iex -S mix phoenix.server`

The tests can also be run continuously using `mix test.watch`

## Packaging the application

A local environment for packaging the application for Ubuntu is available, with the primary purpose being testing pkgr modifications before they are available on packager.io. The packaging procedure is:

1. `vagrant up packager && vagrant ssh packager`
2. `cd && git clone https://github.com/benlangfeld/pkgr.git && cd pkgr`
3. `git checkout [SOME BRANCH] && bundle install`
4. `sudo --preserve-env bundle exec pkgr package /vagrant --verbose --debug`

A second environment (`package_test`) is also available and provisioned with the latest master version of the app installed from packager.io for testing.

## Using the issue tracker

Use the issues tracker for:

* [bug reports](#bug-reports)
* [submitting pull requests](#pull-requests)

Please **do not** use the issue tracker for personal support requests nor feature requests. Support requests should be sent to [the mailing list](http://groups.google.com/group/queueflex), where development issues can also be discussed.

## Bug reports

A bug is a _demonstrable problem_ that is caused by the code in the repository. Good bug reports are extremely helpful - thank you!

Guidelines for bug reports:

1. **Use the GitHub issue search** &mdash; check if the issue has already been reported.

2. **Check if the issue has been fixed** &mdash; try to reproduce it using the `master` branch in the repository.

3. **Isolate and report the problem** &mdash; ideally create a reduced test case.

Please try to be as detailed as possible in your report. Include information about your Operating System and any details of your deployment of the application. Please provide steps to reproduce the issue as well as the outcome you were expecting! All these details will help developers to fix any potential bugs.

Example:

> Short and descriptive example bug report title
>
> A summary of the issue and the environment in which it occurs. If suitable, include the steps required to reproduce the bug.
>
> 1. This is the first step
> 2. This is the second step
> 3. Further steps, etc.
>
> `<url>` - a link to the reduced test case (e.g. a GitHub Gist)
>
> Any other information you want to share that is relevant to the issue being reported. This might include the lines of code that you have identified as causing the bug, and potential solutions (and your opinions on their merits).

## Feature requests

Feature requests are welcome and should be discussed on [the mailing list](http://groups.google.com/group/queueflex), but take a moment to find out whether your idea fits with the scope and aims of the project. It's up to *you* to make a strong case to convince the community of the merits of this feature. Please provide as much detail and context as possible.

## Pull requests

Good pull requests - patches, improvements, new features - are a fantastic help. They should remain focused in scope and avoid containing unrelated commits.

**IMPORTANT**: By submitting a patch, you agree that your work will be licensed under the license used by the project and further agree to surrender copyright in your submission to the majority copyright holder.

If you have any large pull request in mind (e.g. implementing features, refactoring code, etc), **please ask first** otherwise you risk spending a lot of time working on something that the project's developers might not want to merge into the project.

Please adhere to the coding conventions in the project (indentation, accurate comments, etc.) and don't forget to add your own tests and documentation. When working with git, we recommend the following process in order to craft an excellent pull request:

1. [Fork](http://help.github.com/fork-a-repo/) the project, clone your fork,
   and configure the remotes:

   ```bash
   # Clone your fork of the repo into the current directory
   git clone https://github.com/<your-username>/queueflex
   # Navigate to the newly cloned directory
   cd queueflex
   # Assign the original repo to a remote called "upstream"
   git remote add upstream https://github.com/benlangfeld/queueflex
   ```

2. If you cloned a while ago, get the latest changes from upstream, and update your fork:

   ```bash
   git checkout master
   git pull upstream master
   git push
   ```

3. Create a new topic branch (off of `master`) to contain your feature, change, or fix.

   **IMPORTANT**: Making changes in `master` is discouraged. You should always keep your local `master` in sync with upstream `master` and make your changes in topic branches.

   ```bash
   git checkout -b <topic-branch-name>
   ```

4. Commit your changes in logical chunks. Keep your commit messages organized, with a short description in the first line and more detailed information on the following lines. Feel free to use Git's [interactive rebase](https://help.github.com/articles/interactive-rebase) feature to tidy up your commits before making them public.

5. Make sure all the tests are still passing.

   ```bash
   mix test
   ```

6. Push your topic branch up to your fork:

   ```bash
   git push origin <topic-branch-name>
   ```

7. [Open a Pull Request](https://help.github.com/articles/using-pull-requests/) with a clear title and description.

8. If you haven't updated your pull request for a while, you should consider rebasing on master and resolving any conflicts.

   **IMPORTANT**: _Never ever_ merge upstream `master` into your branches. You should always `git rebase` on `master` to bring your changes up to date when necessary.

   ```bash
   git checkout master
   git pull upstream master
   git checkout <your-topic-branch>
   git rebase master
   ```

### Commit Messages

All pull request commit messages are automatically checked using [GitCop](http://gitcop.com) - this will inform you if there are any issues with your commit message and give you an oppertunity to change it.

#### Length

No line in your commit message shoult be longer than **72** characters. If you have something that is longer than this (such as a url), please put it on to multiple lines with a backspace at the end of each line.

#### Subject

The subject (first commit line) should be written in the past tense and should start with a lower case letter. e.g.

    feat(QueueFlex.Router): add a missing route

Instead of:

    Feat(QueueFlex.Router): Add a missing route

#### Format

Because Changex automatically generates the [CHANGELOG.md](https://github.com/benlangfeld/QueueFlex/blob/master/CHANGELOG.md) from the commit messages, it is important that the follow these rules.

Please ensure that your commit messages follow the following format:

    %{type}(%{scope}): %{description}

Where type is one of the following:

 * **feat** - A feature
 * **fix** - A bug fix or fixes to broken tests
 * **docs** - Documentation changes
 * **style** - Code changes such as whitespace or bracket position
 * **refactor** - Code changes that do not fit in the above
 * **perf** - Code changes that improve performance
 * **test** - Adding missing tests
 * **revert** - Reverting the code changes in a previous commit
 * **chore** - Changes that do not fit elsewhere

Breaking changes should be added at the bottom of the commit message in the following format:

    BREAKING CHANGE: description

## Releasing

In order to release a new version of this project, the following process is required:

1. Create a release branch eg `release/x.y.z`
1. Update the application version in `mix.exs`
1. Generate an update to the changelog: `mix changex.update --github benlangfeld/QueueFlex`
1. Commit the new version number and changelog update
1. Push the branch and open a PR for testing
1. Merge the PR if all checks pass
1. Tag the PR merge commit with the version number eg `v1.2.3` and push the tag

Thank you for your contributions!
