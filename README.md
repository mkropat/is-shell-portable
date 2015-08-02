## Contributing

### Set Up

The `gh-pages` submodule must be checked out for the site to run.  The
following command will both clone the repo and check out the submodule:

    git clone --recursive https://github.com/mkropat/is-shell-portable.git

To develop on the site locally:

    cd gh-pages
    jekyll serve

Then open `http://localhost:4000/is-shell-portable/` in your web browser.

(See the [Jekyll docs](http://jekyllrb.com/docs/quickstart/) for Jekyll
installation instructions.)

Re-building the data files __requires__ [`jq`](https://stedolan.github.io/jq/)
(version > 1.5).  Download the rc from the site and add it to your `$PATH`.

### Adding Commands

You can add new commands by modifying the files in the [`data/`](data/)
directory and submitting a pull request.

### Adding Platforms

__Note__: the site already has too many columns, so it is unlikely that new
platforms will be accepted until the site code is re-worked to dynamically
show/hide columns.

#### With Vagrant Host (Preferred)

In order to be automated and repeatable, new platforms will ideally be
available as a [Vagrant image](https://www.vagrantup.com/).  Add the new image
to [`boxes.json`](boxes.json), then run:

    vagrant up
    ./run-cmds data/posix-cmds.json data/additional-cmds.json

#### Without Vagrant

Not all platforms support being a Vagrant image (typically due to licensing
issues).  If necessary, it is also possible to do a manual run:

    ./run-cmds -l PLATFORM_NAME data/posix-cmds.json data/additional-cmds.json

### Ideas

If you have a suggestion, feel free [to submit a Github
issue](https://github.com/mkropat/is-shell-portable/issues). (Pull requests are
even better.)
