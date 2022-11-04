-- Living Looper Target
:{
llTarget = Target  {oName      = "Living Looper", 
                    oAddress   = "127.0.0.1", 
                    oHandshake = False, 
                    oPort      = 6789, 
                    oBusPort   = Nothing, 
                    oLatency   = 0.1, 
                    oSchedule  = Pre BundleStamp, 
                    oWindow    = Nothing
                  }
:}

-- Living Looper OSC Specs
:{
llOSCSpecs = [OSC "/ll/{llmodel}/mix"   $ ArgList [("llmix", Nothing)],
              OSC "/ll/{llmodel}/gain"  $ ArgList [("llgain", Nothing)],
              OSC "/ll/{llmodel}/loopindex" $ ArgList [("llslot", Nothing)],
              OSC "/ll/{llmodel}/pitch/ratio" $ ArgList [("llpitchratio", Nothing)],
              OSC "/ll/{llmodel}/pitch/grain" $ ArgList [("llpitchgrain", Nothing)],
              OSC "/ll/{llmodel}/pitch/disperse" $ ArgList [("llpitchdisperse", Nothing)],
              OSC "/ll/{llmodel}/pitch/time" $ ArgList [("llpitchtimedisperse", Nothing)]
             ]
:}

-- Living Looper Parameters
:{
let llmix   = pF "llmix"
    llgain  = pF "llgain"
    llslot  = pI "llslot"
    ll      = pS "llmodel"
:}

-- Living Looper PitchShift.ar
:{
let llpitchratio = pF "llpitchratio"
    llpitchgrain = pF "llpitchgrain"
    llpitchdisperse = pF "llpitchdisperse"
    llpitchtimedisperse = pF "llpitchtimedisperse"
:}

-- Living Looper Shortcuts
:{
let llpitch r d t = llpitchratio r # llpitchdisperse d # llpitchtimedisperse t
:}

-- Living Looper OSC Map
llOscMap = (llTarget, llOSCSpecs)

-- Living Looper Utilities
-- hushll = once $ ll "[speech, darbouka, fallout]" # llgain 0



