/*
TODO

This is copied from RAVE SuperCollider
But since Living Looper has N input slots,
It would make more sense from Tidal if each input slot was 
routed to its own orbit?
That would imply another layer after SuperDirt to handle that routing

*/

thisProcess.openUDPPort(6789);

(
~llInBuses  = [
    Bus.audio(s, numChannels:~dirt.numChannels),
    Bus.audio(s, numChannels:~dirt.numChannels),
    Bus.audio(s, numChannels:~dirt.numChannels),
    Bus.audio(s, numChannels:~dirt.numChannels),
    Bus.audio(s, numChannels:~dirt.numChannels)
];
~dirt.orbits[0].outBus = ~llInBuses[0];
~dirt.orbits[1].outBus = ~llInBuses[1];
~dirt.orbits[2].outBus = ~llInBuses[2];
~dirt.orbits[3].outBus = ~llInBuses[3];
~dirt.orbits[4].outBus = ~llInBuses[4];
~llOutBuses  = Bus.new(index:0, numChannels:10);
~llSynth = {
    var in = InBus.ar(~llInBuses[\llLoopIndex.kr(0)], 2);
    var out = Limiter.ar(
        LivingLooper.new(
            "/Users/jack/Documents/git/pro/iil/artifacts/livinglooper/2022-11-04_ll_test/2022-11-04_ll-test.ts", 
            5,
            Mix.ar(in),
            \llLoopIndex.kr(0)
    ));
    // out = SplayAz.ar(~dirt.numChannels, out);
    // out = Mix.ar(out);
    out = (in * (1 - \llMix.kr(1))) + (out * \llMix.kr(1));
    out = out * \llGain.kr(1) * 0.8;
    out = out!~dirt.numChannels;
    // https://doc.sccode.org/Classes/Monitor.html
    // Duplicate into monitor
    // Find bus indexes
    // Send back out to SuperDirt buses somehow
    // out = PitchShift.ar(out, \llPitchGrain.kr(0.2), \llPitchRatio.kr(1.0), \llPitchDisperse.kr(0.003), \llPitchTimeDisperse.kr(0.003));
}.play(outbus:~llOutBus);

OSCFunc({ |msg| ~llSynth.set(\llMix,msg[1]);},               "/ll/test/mix",            nil);
OSCFunc({ |msg| ~llSynth.set(\llGain,msg[1]);},              "/ll/test/gain",           nil);
OSCFunc({ |msg| ~llSynth.set(\llLoopIndex,msg[1].postln);},  "/ll/test/loopindex",      nil);
// OSCFunc({ |msg| ~llSynth.set(\llPitchRatio,msg[1]);},        "/ll/test/pitch/ratio",    nil);
// OSCFunc({ |msg| ~llSynth.set(\llPitchGrain,msg[1]);},        "/ll/test/pitch/grain",    nil);
// OSCFunc({ |msg| ~llSynth.set(\llPitchDisperse,msg[1]);},     "/ll/test/pitch/disperse", nil);
// OSCFunc({ |msg| ~llSynth.set(\llPitchTimeDisperse,msg[1]);}, "/ll/test/pitch/time",     nil);
)
