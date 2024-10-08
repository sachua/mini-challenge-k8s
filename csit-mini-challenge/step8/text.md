Create a Pod with the name `command-center` using the image `sachua/task-3:v0.0.1` in the `default` namespace.
Ensure that `command-center` is able to communicate with `investigation-unit` and `analysis-unit` on port `80`.
You should expose the pods by creating services `investigation-svc` and `analysis-svc`.
