# GitHub
Swift API for GitHub. Still WIP.

## Why?

Why do you want this?
Because it's built on  `Sweeft` using Promises to give you an easy to use, reactive style API.

For instance, let's think of a complicated request you might want to do that would take forever using another API.

Say you're looking at Freddy.swift and want to know what other Swift projects the collaborators from Freddy have built.

```Swift
let api = GitHub(...)
let members = Repository.with(id: 95780130, using: api).flatMap { $0.collaborators() }
let repositories = members.flatMap { $0.map({ $0.repos() }).bulk.flattened }
let swiftRepositories = repositories.map { $0.filter { $0.value.detail?.language == "Swift" } }

swiftRepositories.onResult { result in
    print(result)
}
```

Now granted. This isn't very simple code. But you'll have to admit that it's short!
