# garnix Terms and Conditions

This repository contains garnix's Terms and Conditions. We make them available
here to:

a) **facilitate comparison of any updates to our terms**. You can simply check
   the diff betweent the two relevant commits
b) **allow for questions and contributions**. Open an issue or submit a PR.
c) **make it easy for other people to keep their terms simple**. You can either
   fork this repo, or import it as a `nix` project, or use it as a `vale` style.

**Note**: None of the content here is legal advice, or legally binding. Even
the `terms.html` themselves are not to be preferred over what you find on
[our website](https://garnix.io).

## Branches

The HEAD of the `main` branch constitutes the current terms. `upcoming` is where
upcoming changes go.

## Style

We strive to make the terms short and easy to understand. This includes
avoiding legalese where possible.

There is a lot of literature on "plain English" legal writing. A good starting
point is Bryan A. Garner's "Legal Writing in Plain English" or Kenneth Adams'
"A Manual of Style for Contract Drafting".

We use [`vale`](https://vale.sh) to encode and enforce style guidelines for
simple legal writing.


## Inspiration

Some

## Contributing

If anything is unclear, open an issue!

If you have an improvement to suggest, do open a pull request. Note however that
often legal writing has specific reasons for being written that way, and that
reviews are not always done by lawyers, so where possible link to reputable
sources providing arguments for the change.

For example, if you are suggesting a change from "represents and warrants" to
"states", you might link to [this article](https://www.americanbar.org/groups/business_law/resources/business-law-today/2015-october/the-phrase-represents-and-warrants-is-pointless-and-confusing/).

Always send pull requests to the `upcoming` branch. Since users must be
notified of changes to the terms, and it's annoying to receive these emails, we
bundle a number of these changes together in the `upcoming` branch. We then send
out an email about the changes, and merge `upcoming` into `main`.
