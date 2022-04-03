<div id="top"></div>
<div align="center">
  <h1 align="center">Vaxiin Quick Start Guide</h1>

  <p align="center">
    A quick-start guide to walk you through bringing up the Vaxiin framework
    <br />
    <a href="https://docs.vaxiin.io"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/rebootoio/vaxiin-sandbox/issues/new?assignees=&labels=bug&template=bug_report.md&title=">Report Bug</a>
    ·
    <a href="https://github.com/rebootoio/vaxiin-sandbox/issues/new?assignees=&labels=enhancement&template=feature_request.md&title=">Request Feature</a>
  </p>
  <a href='https://discord.gg/aEJ6qwcCGs'>
    <img src='https://img.shields.io/discord/813371439469297674?style=for-the-badge'>
  </a>
  <a href='https://github.com/rebootoio/vaxiin-sandbox/blob/main/LICENSE'>
    <img src='https://img.shields.io/github/license/rebootoio/vaxiin-sandbox?style=for-the-badge'>
  </a>
  <!--
  <p align="center">
    <b>Vaxiin is a cure for zombie server infections.</b><br/ >
    Or in more technical terms:
    <br />
    <b>Vaxiin is an out-of-band automation framework</b> allowing for:<br>
      failure detection<br />
      remote state extraction<br />
      human and machine recovery emulation<br />
    </ul>
  </p>
  -->
</div>

## Overview
**Vaxiin is an out-of-band automation framework** allowing for:  
- failure detection
- remote state extraction
- human and machine recovery emulation



## Installation Options

### CLI

Go to the [latest release](https://github.com/rebootoio/vaxctl/releases/latest), download the binary and place it in a directory you have in your `PATH`

### Server

Clone this repository, and then run:

```
cd vaxiin-sandbox
docker run -d -v $(pwd):/db -p 5000:5000 --rm rebooto/vaxiin-server
```

That's it, you're ready to go!

### In the Sandbox

1. Input a set of out-of-band credentials for your test server

   Edit `data/cred/default.yaml` and add out-of-band credentials

2. Input your test server details

   Edit `data/device/test_device.yaml` adding the device's IPMI IP and model (per [this list](https://docs.vaxiin.io/faq#what-models-do-you-support))

3. Load all of the data into your local Vaxiin instance

   ```
   cd data
   ./load_data.sh
   ```

4. Get the state of your test server

   ```
   vaxctl assign work -d test_device -a screenshot
   ```

5. Wait about a minute and view the test server's obtained state and screenshot

   ```
   vaxctl get state -v
   vaxctl get screenshot -d test_device
   ```

6. Run a couple of non-destructive actions against the test server and view their results

   ```
   vaxctl assign work -d test_device -a 'power status','ipmi lan print'
   vaxctl get work -v
   ```

## Next Steps

https://docs.vaxiin.io contains the full documentation, including a [detailed walkthrough](https://docs.vaxiin.io/getting-started/walkthrough)
and [installation instructions](https://docs.vaxiin.io/installation/overview). The list of supported hardware models can be found [here](https://docs.vaxiin.io/faq#what-models-do-you-support).

## Components
| Component | Repoistory | Artifact | Documentation |
|-----------|------------|----------|------|
| Server | [GitHub](https://github.com/rebootoio/vaxiin-server) | [DockerHub](https://hub.docker.com/repository/docker/rebooto/vaxiin-server) | [Docs](https://docs.vaxiin.io/configuration/server) |
| Agent | [GitHub](https://github.com/rebootoio/vaxiin-agent) | [DockerHub](https://hub.docker.com/repository/docker/rebooto/vaxiin-agent) | [Docs](https://docs.vaxiin.io/configuration/agent) |
| CLI | [GitHub](https://github.com/rebootoio/vaxctl)| [Release](https://github.com/rebootoio/vaxctl/releases) | [Docs](https://docs.vaxiin.io/configuration/cli) |

## Contact
We're happy to help at the [Rebooto Discord Server](https://discord.gg/aEJ6qwcCGs)!

Found a problem / have a feature request? [Open an issue](https://github.com/rebootoio/vaxiin-sandbox/issues)!

## License
Distributed under the [AGPL-3.0 License](https://github.com/rebootoio/vaxiin-sandbox/blob/main/LICENSE) License.
