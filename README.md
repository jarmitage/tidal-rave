# tidal-rave

Live coding RAVE (https://github.com/caillonantoine/RAVE) real-time models using TidalCycles and SuperDirt.

## Dependencies

https://github.com/victor-shepardson/rave-supercollider

## Setup

- Add the RAVE OSC target (`rave.hs`) to your TidalCycles Boot.hs
- Run `rave.scd` after SuperDirt has started
- Test the patterns in `rave.tidal`

## Notes

This is a hacky PoC =)

`rave.scd` is a hacky way to integrate with SuperDirt, see https://club.tidalcycles.org/t/the-routing-structure-of-a-dirt-orbit/3902/6.
It replaces output buses of Orbits 0, 1 and 2 with it's own bus. 
That means you are stuck in mono with no `DirtPan` etc.

`rave.hs` is only necessary because of `rave.scd`, if it can be better integrated into SuperDirt then only the custom parameters would be needed.
