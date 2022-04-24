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
- vendor-agnostic automation

## Vaxiin in under a minute

![vaxiin demo](https://www.vaxiin.io/assets/images/vaxctl_usage_33-945e1d8274c6b228e60374390c70ee90.gif)

## Installation options

```
curl https://raw.githubusercontent.com/rebootoio/vaxiin-sandbox/main/install.sh | bash
cd vaxiin-sandbox
```
Or...
<details>
  <summary>
    I want to do it myself
  </summary>

- Server
  
  ```
  git clone https://github.com/rebootoio/vaxiin-sandbox.git
  cd vaxiin-sandbox
  docker run -d -v $(pwd):/db -p 5000:5000 --pull always --rm rebooto/vaxiin-server
  ```
- CLI
  
  Go to the [latest release](https://github.com/rebootoio/vaxctl/releases/latest), download the binary and unzip it to the `vaxiin-sandbox` directory.
</details>
  
**That's it, you're ready to go!**

## In the Sandbox

<details>
  <summary>
    <b>No test server needed</b> - I want to try out screenshots, OCR and rules
  </summary>
  
- Open the screenshot used to create a rule
  
  ```
  ./vaxctl get screenshot -r "exit bios ilo4"
  ```
  
- Edit the rule and play around with the regex
  
  ```
  ./vaxctl edit rule -n "exit bios ilo4"
  ```
  
</details>

<details>
  <summary>
    <b>I have a test server</b> - I want to interact with it
  </summary>


- Input a set of out-of-band credentials for your test server

  Edit `data/cred/default.yaml` and add out-of-band credentials

- Input your test server details

  Edit `data/device/test_device.yaml` adding the device's IPMI IP and model (per [this list](https://docs.vaxiin.io/faq#what-models-do-you-support))

- Load all of the data into your local Vaxiin instance

  ```
  ./data/load_data.sh
  ```

- Get the state of your test server

  ```
  ./vaxctl assign work -d test_device -a screenshot
  ```

- Wait about a minute and view the test server's obtained state and screenshot

  ```
  ./vaxctl get state -v
  ./vaxctl get screenshot -d test_device
  ```

- Run a couple of non-destructive actions against the test server and view their results

  ```
  ./vaxctl assign work -d test_device -a 'power status','ipmi lan print'
  ./vaxctl get work -v
  ```
</details>

## Next Steps

https://docs.vaxiin.io contains the full documentation, including a [detailed walkthrough](https://docs.vaxiin.io/getting-started/walkthrough)
and [installation instructions](https://docs.vaxiin.io/installation/overview).  
The latest list of supported hardware models can be found [here](https://docs.vaxiin.io/faq#what-models-do-you-support).

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
