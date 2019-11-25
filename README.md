
# Energi changes

## The standard FutoIn CID workflow:

```bash
# Ensure builds for production
export mixEnv=prod

# Development
cid prepare
cid build
cid migrate
cid devserve

# Staging builds
cid ci_build master staging

# production builds
cid tag master
cid ci_build NEW_TAG prod
```

## Energi Core Node

```bash
./energi3 \
    --testnet \
    --gcmode archive \
    --rpcvhosts '*' \
    --ws \
    --rpc \
    --rpcapi debug,eth,net,shh,txpool,web3,masternode,energi \
    --wsapi debug,eth,net,shh,txpool,web3,masternode,energi \
    --rpccorsdomain '*' \
    --wsorigins '*'
```

## Important configuration variables to be set at deployment & testing

*Hint: source config/devenv.sh.*

* `BLOCKSCOUT_HOST` - server name
* `SECRET_KEY_BASE` - use `mix phx.gen.secret`
* `CHECK_ORIGIN=true`
* `NETWORK=Energi`
* `SUBNETWORK` - either `Testnet` or `Mainnet`
* `NETWORK_ICON`
* `LOGO=/images/energi_logo.png`
* `LOGO_FOOTER=/images/energi_logo_footer.png`
* `COIN=NRG`
* `ALLOWED_EVM_VERSIONS=petersburg`
* `ETHEREUM_JSONRPC_VARIANT=geth'
* `ETHEREUM_JSONRPC_HTTP_URL=http://127.0.0.1:49796"
* `ETHEREUM_JSONRPC_TRACE_URL=http://127.0.0.1:49796" - Parity specific, no need really
* `ETHEREUM_JSONRPC_WS_URL=ws://127.0.0.1:49795"
* `FIRST_BLOCK=2` - skip heavy genesis and migration stuff

For secondary cluster nodes:

* `DISABLE_INDEXER=true` - disable concurrent indexing

Others:

* `BLOCKSCOUT_PROTOCOL=https`
* `LINK_TO_OTHER_EXPLORERS=false`
* `SUPPORTED_CHAINS=[]`
* `DISABLE_WRITE_API=true`
* `DISABLE_READ_API=false` (there is a bug)
* `MAX_SKIPPING_DISTANCE=2` - protect from reorgs


# Original README

<p align="center">
  <a href="https://blockscout.com">
    <img width="200" src="https://blockscout.com/poa/core/android-chrome-192x192.png" \>
  </a>
</p>

<h1 align="center">BlockScout</h1>
<p align="center">Blockchain Explorer for inspecting and analyzing EVM Chains.</p>
<div align="center">

[![CircleCI](https://circleci.com/gh/poanetwork/blockscout.svg?style=svg&circle-token=f8823a3d0090407c11f87028c73015a331dbf604)](https://circleci.com/gh/poanetwork/blockscout) [![Coverage Status](https://coveralls.io/repos/github/poanetwork/blockscout/badge.svg?branch=master)](https://coveralls.io/github/poanetwork/blockscout?branch=master) [![Join the chat at https://gitter.im/poanetwork/blockscout](https://badges.gitter.im/poanetwork/blockscout.svg)](https://gitter.im/poanetwork/blockscout?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

</div>

BlockScout provides a comprehensive, easy-to-use interface for users to view, confirm, and inspect transactions on EVM (Ethereum Virtual Machine) blockchains. This includes the POA Network, xDai Chain, Ethereum Classic and other **Ethereum testnets, private networks and sidechains**.

See our [project documentation](https://docs.blockscout.com/) for detailed information and setup instructions.

Visit the [POA BlockScout forum](https://forum.poa.network/c/blockscout) for FAQs, troubleshooting, and other BlockScout related items. You can also post and answer questions here.

You can also access the dev chatroom on our [Gitter Channel](https://gitter.im/poanetwork/blockscout).

## About BlockScout

BlockScout is an Elixir application that allows users to search transactions, view accounts and balances, and verify smart contracts on the Ethereum network including all forks and sidechains.

Currently available full-featured block explorers (Etherscan, Etherchain, Blockchair) are closed systems which are not independently verifiable.  As Ethereum sidechains continue to proliferate in both private and public settings, transparent, open-source tools are needed to analyze and validate transactions.

## Supported Projects

BlockScout supports a number of projects. Hosted instances include POA Network, xDai Chain, Ethereum Classic, Sokol & Kovan testnets, and other EVM chains. 

- [List of hosted mainnets, testnets, and additional chains using BlockScout](https://docs.blockscout.com/for-projects/supported-projects)
- [Hosted instance versions](https://docs.blockscout.com/about/use-cases/hosted-blockscout)


## Getting Started

See the [project documentation](https://docs.blockscout.com/) for instructions:
- [Requirements](https://docs.blockscout.com/for-developers/information-and-settings/requirements)
- [Ansible deployment](https://docs.blockscout.com/for-developers/ansible-deployment)
- [Manual deployment](https://docs.blockscout.com/for-developers/manual-deployment)
- [ENV variables](https://docs.blockscout.com/for-developers/information-and-settings/env-variables)
- [Configuration options](https://docs.blockscout.com/for-developers/configuration-options)


## Acknowledgements

We would like to thank the [EthPrize foundation](http://ethprize.io/) for their funding support.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution and pull request protocol. We expect contributors to follow our [code of conduct](CODE_OF_CONDUCT.md) when submitting code or comments.

## License

[![License: GPL v3.0](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.
