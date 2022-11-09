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
~llOutBus = Bus.new(index:0, numChannels:2);
~llBus = Bus.audio(s, numChannels:~dirt.numChannels);
~dirt.orbits[0].outBus = ~llBus;
~llSynth = {
    var in = InBus.ar(~llBus, 2);
    var out = Limiter.ar(
        LivingLooper.new(
            "/Users/jack/Documents/git/pro/iil/artifacts/livinglooper/2022-11-04_ll_test/2022-11-04_ll-test.ts", 
            5,
            Mix.ar(in),
            \llLoopIndex.kr(0)
    ));
    // out = SplayAz.ar(~dirt.numChannels, out);
    out = Mix.ar(out);
    out = (in * (1 - \llMix.kr(1))) + (out * \llMix.kr(1));
    out = out * \llGain.kr(1) * 0.8;
    out = out!~dirt.numChannels;
    out = PitchShift.ar(out, \llPitchGrain.kr(0.2), \llPitchRatio.kr(1.0), \llPitchDisperse.kr(0.003), \llPitchTimeDisperse.kr(0.003));
}.play(outbus:~llOutBus);
)

(
OSCFunc({ |msg| ~llSynth.set(\llMix,msg[1]);},               "/ll/test/mix",            nil);
OSCFunc({ |msg| ~llSynth.set(\llGain,msg[1]);},              "/ll/test/gain",           nil);
OSCFunc({ |msg| ~llSynth.set(\llLoopIndex,msg[1].postln);},  "/ll/test/loopindex",      nil);
OSCFunc({ |msg| ~llSynth.set(\llPitchRatio,msg[1]);},        "/ll/test/pitch/ratio",    nil);
OSCFunc({ |msg| ~llSynth.set(\llPitchGrain,msg[1]);},        "/ll/test/pitch/grain",    nil);
OSCFunc({ |msg| ~llSynth.set(\llPitchDisperse,msg[1]);},     "/ll/test/pitch/disperse", nil);
OSCFunc({ |msg| ~llSynth.set(\llPitchTimeDisperse,msg[1]);}, "/ll/test/pitch/time",     nil);
)
