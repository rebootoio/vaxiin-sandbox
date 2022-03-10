# Quick Start

The following quick-start guide will walk you through standing up the Vaxiin framework.

## Installation Options

- Docker Compose (TODO)
- Docker (TODO)

## Next Steps

Now that you have Vaxiin up and running, you can begin healing zombies.\
https://docs.vaxiin.io contains the full documentation, including a [detailed walkthrough](https://docs.vaxiin.io/getting-started/walkthrough).\
The list of supported hardware models can be found [here](https://docs.vaxiin.io/faq#what-models-do-you-support).

In this guide, we'll assume you have setup the environment, and provide you with some ready-made actions and rules.

### In the Sandbox

1. Create a set of out-of-band credentials for your target server

   Edit `cred/default.yaml` and add out-of-band credentials
   ```
   vaxctl apply cred -f cred/default.yaml
   ```

2. Create your target server

   Edit `device/test_device.yaml` adding the device's IPMI IP.
   ```
   vaxctl apply device -f device/test_device.yaml
   ```

3. Get the state of your server

   ```
   vaxctl assign work -d test_device -a screenshot
   ```

4. Wait about a minute and view the server's state and screenshot

   ```
   vaxctl get state -v
   vaxctl get screenshot -d test_device -f /tmp/test_device.png
   ```

5. Run a couple of non-destructive actions against the server and view their results

   ```
   vaxctl assign work -d test_device -a 'power status','ipmi lan print'
   vaxctl get work -v
   ```
