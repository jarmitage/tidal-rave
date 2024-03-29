/*
Typical workflow:
1. Load a model with `NN.load()`
2. Open a port for OSC from Tidal
3. Define a synth that uses the model
4. Create OSC receivers that map onto synth controls
*/

// In startup.scd, add e.g.
s.waitForBoot {
    NN.load(\raveModel, "~/rave-models/mrp_strengjavera_b2048_r44100_z16.ts");
    NN(\raveModel).describe;
}

// Open a port for OSC from Tidal
thisProcess.openUDPPort(6789);

// RAVE Forward
(
~raveOutBus = Bus.new(index:0, numChannels:2);
~raveBus = Bus.audio(s, numChannels:~dirt.numChannels);
~dirt.orbits[0].outBus = ~raveBus;
~raveSynth = {
    var in, forward, out;
	in = Mix.new(InBus.ar(~raveBus, 2)) * 0.5;
	forward = NN(\raveModel, \forward).ar(in, 2048);
	out = forward;
    out = (in * (1 - \raveMix.kr(1))) + (out * \raveMix.kr(1));
    out = out * \raveGain.kr(1) * 0.8;
    out = out!~dirt.numChannels;
    out = PitchShift.ar(out, \ravePitchGrain.kr(0.2), \ravePitchRatio.kr(1.0), \ravePitchDisperse.kr(0.003), \ravePitchTimeDisperse.kr(0.003));
}.play(outbus:~raveOutBus);
)

// Create OSC receivers that map onto ~raveSynth controls
// Replace "ravemodel" with the name of the model you loaded.
(
OSCFunc({ |msg| ~raveSynth.set(\raveMix,msg[1]);},               "/rave/ravemodel/mix",            nil);
OSCFunc({ |msg| ~raveSynth.set(\ravePrior,msg[1]);},             "/rave/ravemodel/prior",          nil);
OSCFunc({ |msg| ~raveSynth.set(\raveTemp,msg[1]);},              "/rave/ravemodel/temp",           nil);
OSCFunc({ |msg| ~raveSynth.set(\raveGain,msg[1]);},              "/rave/ravemodel/gain",           nil);
OSCFunc({ |msg| ~raveSynth.set(\ravePan,msg[1]);},               "/rave/ravemodel/pan",            nil);
OSCFunc({ |msg| ~raveSynth.set(\ravePitchRatio,msg[1]);},        "/rave/ravemodel/pitch/ratio",    nil);
OSCFunc({ |msg| ~raveSynth.set(\ravePitchGrain,msg[1]);},        "/rave/ravemodel/pitch/grain",    nil);
OSCFunc({ |msg| ~raveSynth.set(\ravePitchDisperse,msg[1]);},     "/rave/ravemodel/pitch/disperse", nil);
OSCFunc({ |msg| ~raveSynth.set(\ravePitchTimeDisperse,msg[1]);}, "/rave/ravemodel/pitch/time",     nil);
)

// RAVE Encode->Decode
(
~raveOutBus = Bus.new(index:0, numChannels:2);
~raveBus = Bus.audio(s, numChannels:~dirt.numChannels);
~dirt.orbits[0].outBus = ~raveBus;
~raveSynth = {
    var in, latent, resynth, out;
    in = Mix.new(InBus.ar(~raveBus, 2)) * 0.5;
    latent = NN(\rave, \encode).ar(2048, in);
    resynth = NN(\rave, \decode).ar(2048, latent);
    out = resynth;
    out = (in * (1 - \raveMix.kr(1))) + (out * \raveMix.kr(1));
    out = out * \raveGain.kr(1) * 0.8;
    out = out!~dirt.numChannels;
}.play(outbus:~raveOutBus);
)

// RAVE Encode->Decode
(
~raveOutBus = Bus.new(index:0, numChannels:2);
~raveBus = Bus.audio(s, numChannels:~dirt.numChannels);
~dirt.orbits[0].outBus = ~raveBus;
~raveSynth = {
    var in, latent, resynth, out;
    in = Mix.new(InBus.ar(~raveBus, 2)) * 0.5;
    latent = NN(\rave, \encode).ar(2048, in);
    resynth = NN(\rave, \decode).ar(2048, latent);
    out = resynth;
    out = (in * (1 - \raveMix.kr(1))) + (out * \raveMix.kr(1));
    out = out * \raveGain.kr(1) * 0.8;
    out = out!~dirt.numChannels;
}.play(outbus:~raveOutBus);
)

// RAVE Latent->Decode
// TODO: Handle latents from Tidal.
(
~raveOutBus = Bus.new(index:0, numChannels:2);
~raveBus = Bus.audio(s, numChannels:~dirt.numChannels);
~dirt.orbits[0].outBus = ~raveBus;
~raveSynth = {
    var in, latent, resynth, out;
    in = Mix.new(InBus.ar(~raveBus, 2)) * 0.5;
    latent = \raveLatent.kr(1);
    resynth = NN(\rave, \decode).ar(latent, 2048);
    out = resynth;
    out = (in * (1 - \raveMix.kr(1))) + (out * \raveMix.kr(1));
    out = out * \raveGain.kr(1) * 0.8;
    out = out!~dirt.numChannels;
}.play(outbus:~raveOutBus);
)

// RAVE Encode->Modified Latents->Decode
// TODO: Add latent modifier controls and handle from Tidal.
(
~raveOutBus = Bus.new(index:0, numChannels:2);
~raveBus = Bus.audio(s, numChannels:~dirt.numChannels);
~dirt.orbits[0].outBus = ~raveBus;
~raveSynth = {
    var in, latent, modLatent, resynth, out;
    in = Mix.new(InBus.ar(~raveBus, 2)) * 0.5;
    latent = NN(\rave, \encode).ar(2048, in);
    // modLatent = latent // potentially modify latent here
    resynth = NN(\rave, \decode).ar(latent, 2048);
    out = resynth;
    out = (in * (1 - \raveMix.kr(1))) + (out * \raveMix.kr(1));
    out = out * \raveGain.kr(1) * 0.8;
    out = out!~dirt.numChannels;
}.play(outbus:~raveOutBus);
)
