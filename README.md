# tidal-rave

Live coding [RAVE](https://github.com/caillonantoine/RAVE) neural audio synthesis models using [TidalCycles](https://tidalcycles.org) and [SuperDirt](https://github.com/musikinformatik/SuperDirt/).

## Dependencies

https://github.com/elgiano/nn.ar

> Note: if you have a previous version of `rave-supercollider` installed in your SuperCollider Extensions folder, delete it, otherwise you will experience `Symbol not found` errors for `libtorch`.

## Usage

- Add the RAVE OSC target (`rave.hs`) to your TidalCycles Boot.hs
- Run `rave.scd` after SuperDirt has started
- Test the patterns in `rave.tidal`

## Models

You can find various CC-licensed models here:
https://huggingface.co/Intelligent-Instruments-Lab/rave-models

You can also train your own models, see https://github.com/caillonantoine/RAVE.

For faster training via transfer learning, see https://github.com/victor-shepardson/RAVE.

## Limitations

`rave.scd` is a hacky way to integrate with SuperDirt.
It replaces output buses of Orbits 0, 1 and 2 with it's own bus. 
That means you are stuck in mono with no `DirtPan` etc.

`rave.hs` is only necessary because of `rave.scd`, if it can be better integrated into SuperDirt then only the custom parameters would be needed.

## Discussion

https://scsynth.org/t/experiences-with-rave-ugen/6398/32

https://club.tidalcycles.org/t/the-routing-structure-of-a-dirt-orbit/3902/6
