# Step 0: set up

## Tips

You can install [GitHub CLI](https://cli.github.com/) and use it to SSH into your codespace with:

```shell
gh codespace ssh
gh cs ssh
```

## Set up your local sandox

Create a sandbox folder in which you'll be able to take note or create without impacting other.

The goal here is to have a playground in your Codespace filesystem where you can write things down and try things out.

> [!warning]
> Be sure to copy everything you added in this folder before destroying your codespace.
> Check the **Advanced** section below if you want to save them in another repository.

```shell
mkdir sandbox
```

This folder is ignored by git (cf. [.gitignore](../../.gitignore)).

## Advanced

> [!important]
> Only do this if you feel comfortable using `git` as no support from @fhuitelec will be provided.

If you want to track in another remote git repository:

1. create a GitHub repository
2. run the following:

```shell
cd sandbox
git init
git remote add origin git@github.com:XXX/YYY.git
```

> [!warning]
> Be careful: from now on, you are dealing with 2 nested git repository. This means that `git` will have a different effect depending on where you are.
