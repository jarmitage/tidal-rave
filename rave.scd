thisProcess.openUDPPort(6789);

(
~raveSpeechOutBus = Bus.new(index:0, numChannels:2);
~raveSpeechBus = Bus.audio(s, numChannels:~dirt.numChannels);
~dirt.orbits[0].outBus = ~raveSpeechBus;
~raveSpeechCtl = RAVEControl(s,
    modelFile:"/Users/jarm/Downloads/rave_rt_models/speech_realtime.ts"
);
~raveSpeechSynth = {
    var in = InBus.ar(~raveSpeechBus, 2);
    var out = Limiter.ar(
        RAVE.ar(~raveDarboukaCtl, Mix.ar(in), \raveSpeechPrior.kr(0), \raveSpeechTemp.kr(0));
    );
    out = (in * (1 - \raveSpeechMix.kr(1))) + (out * \raveSpeechMix.kr(1));
    out = out!~dirt.numChannels;
}.play(outbus:~raveSpeechOutBus);
)
(
~raveSpeechCtl.load(~raveSpeechSynth);
OSCFunc({ |msg| ~raveSpeechSynth.set(\raveSpeechMix,msg[1]);}, "/rave/speech/mix", nil);
OSCFunc({ |msg| ~raveSpeechSynth.set(\raveSpeechPrior,msg[1]);}, "/rave/speech/prior", nil);
OSCFunc({ |msg| ~raveSpeechSynth.set(\raveSpeechTemp,msg[1]);}, "/rave/speech/temp", nil);
)

(
~raveDarboukaOutBus = Bus.new(index:0, numChannels:2);
~raveDarboukaBus = Bus.audio(s, numChannels:~dirt.numChannels);
~dirt.orbits[1].outBus = ~raveDarboukaBus;
~raveDarboukaCtl = RAVEControl(s,
    modelFile:"/Users/jarm/Downloads/rave_rt_models/darbouka_realtime.ts"
);
~raveDarboukaSynth = {
    var in = InBus.ar(~raveDarboukaBus, 2);
    var out = Limiter.ar(
        RAVE.ar(~raveDarboukaCtl, Mix.ar(in), \raveDarboukaPrior.kr(0), \raveDarboukaTemp.kr(0));
    );
    out = (in * (1 - \raveDarboukaMix.kr(1))) + (out * \raveDarboukaMix.kr(1));
    out = out!~dirt.numChannels;
}.play(outbus:~raveDarboukaOutBus);
)
(
~raveDarboukaCtl.load(~raveDarboukaSynth);
OSCFunc({ |msg| ~raveDarboukaSynth.set(\raveDarboukaMix,msg[1]);}, "/rave/darbouka/mix", nil);
OSCFunc({ |msg| ~raveDarboukaSynth.set(\raveDarboukaPrior,msg[1]);}, "/rave/darbouka/prior", nil);
OSCFunc({ |msg| ~raveDarboukaSynth.set(\raveDarboukaTemp,msg[1]);}, "/rave/darbouka/temp", nil);
)

(
~raveFalloutOutBus = Bus.new(index:0, numChannels:2);
~raveFalloutBus = Bus.audio(s, numChannels:~dirt.numChannels);
~dirt.orbits[2].outBus = ~raveFalloutBus;
~raveFalloutCtl = RAVEControl(s,
    modelFile:"/Users/jarm/Downloads/rave_rt_models/fallout_realtime.ts"
);
~raveFalloutSynth = {
    var in = InBus.ar(~raveFalloutBus, 2);
    var out = Limiter.ar(
        RAVE.ar(~raveFalloutCtl, Mix.ar(in), \raveFalloutPrior.kr(0), \raveFalloutTemp.kr(0));
    );
    out = (in * (1 - \raveFalloutMix.kr(1))) + (out * \raveFalloutMix.kr(1));
    out = out!~dirt.numChannels;
}.play(outbus:~raveFalloutOutBus);
)
(
~raveFalloutCtl.load(~raveFalloutSynth);
OSCFunc({ |msg| ~raveFalloutSynth.set(\raveFalloutMix,msg[1]);}, "/rave/fallout/mix", nil);
OSCFunc({ |msg| ~raveFalloutSynth.set(\raveFalloutPrior,msg[1]);}, "/rave/fallout/prior", nil);
OSCFunc({ |msg| ~raveFalloutSynth.set(\raveFalloutTemp,msg[1]);}, "/rave/fallout/temp", nil);
)
