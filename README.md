### Mathics in Docker container

While [Wolfram Alpha] is great when I have no full Mathematica nearby, it is a little bit slow and too glorious. Python or [Mathics] come to rescue! Unfortunately, [mathics.net] is abysmally sluggish. So the choice is to run Mathics within Docker (on private [Deis]).

Run it locally with:

    docker run --rm -ti -p 8000:8000 arkadi/mathics

Open [localhost:8000](http://localhost:8000/).

Run it on Deis:

    deis create mathics
    deis pull arkadi/mathics

Or build your own:

    export DEV_REGISTRY=docker-registry.your.com:5000
    docker build -t arkadi/mathics:latest .
    docker tag arkadi/mathics $DEV_REGISTRY/arkadi/mathics
    docker push $DEV_REGISTRY/arkadi/mathics
    deis create mathics
    deis pull $DEV_REGISTRY/arkadi/mathics

Or build directly on Deis:

    deis create mathics
    git push deis master


[Wolfram Alpha]: http://www.wolframalpha.com/
[Mathics]: http://mathics.org/
[mathics.net]: http://mathics.net/
[Deis]: http://deis.io/
