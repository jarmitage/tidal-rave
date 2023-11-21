# tidal-rave

Live coding [RAVE](https://github.com/caillonantoine/RAVE) neural audio synthesis models using [TidalCycles](https://tidalcycles.org) and [SuperDirt](https://github.com/musikinformatik/SuperDirt/).

## Dependencies

https://github.com/elgiano/nn.ar

> Note: if you have a previous version of `rave-supercollider` installed in your SuperCollider Extensions folder, delete it, otherwise you will experience `Symbol not found` errors for `libtorch`.

## Usage

- Add the RAVE OSC target (`rave.hs`) to your TidalCycles `Boot.hs`.
- Run `rave.scd` after SuperDirt has started.
- Test the patterns in `rave.tidal`.

## Models

You can find various CC-licensed models here:
https://huggingface.co/Intelligent-Instruments-Lab/rave-models

You can also train your own models, see https://github.com/caillonantoine/RAVE.

For faster training via transfer learning, see https://github.com/victor-shepardson/RAVE.

## Limitations

This is a simple way of using RAVE in SuperDirt and is quite limited.

### SuperDirt
- RAVE models are mono.
- One RAVE model is assigned to one orbit.
- `rave.scd` replaces SuperDirt output buses of Orbits 0, 1 and 2 with it's own bus.
- No `DirtPan` currently interated into `rave.scd`.

### Tidal
- Most of `rave.hs` is only necessary because of `rave.scd`. If the latter can be improved, then only the custom parameters would be needed in Tidal.
- Not possible currently to pattern the RAVE model itself due to the SuperDirt limitations described above.
- RAVE latents not currently implemented on Tidal side.

## TODO
- Improved integration with SuperDirt
- RAVE Prior variations
- Mixing and match encoders and decoders
- Patterning model names from Tidal (via Ndef?)

## Discussion

https://scsynth.org/t/experiences-with-rave-ugen/6398/32

https://club.tidalcycles.org/t/tidal-x-rave-realtime-audio-variational-autoencoder/4973
