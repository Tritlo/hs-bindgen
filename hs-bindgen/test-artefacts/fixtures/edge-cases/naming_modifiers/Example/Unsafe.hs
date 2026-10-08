{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_HADDOCK prune #-}

module Example.Unsafe
    ( Example.Unsafe.ffi_widget_create
    )
  where

import qualified HsBindgen.Runtime.Support as BG
import qualified HsBindgen.Runtime.Support.CAPI
import Example
import Prelude (IO)

$(HsBindgen.Runtime.Support.CAPI.addCSource (HsBindgen.Runtime.Support.CAPI.unlines
  [ "#include <edge-cases/naming_modifiers.h>"
  , "void hs_bindgen_4ce1977df8bd0ad4 ("
  , "  widget_state arg1,"
  , "  widget_callback arg2,"
  , "  widget *arg3"
  , ")"
  , "{"
  , "  *arg3 = (widget_create)(arg1, arg2);"
  , "}"
  ]))

-- __unique:__ @test_edgecasesnaming_modifiers_Example_Unsafe_widget_create@
foreign import ccall unsafe "hs_bindgen_4ce1977df8bd0ad4" hs_bindgen_4ce1977df8bd0ad4_base ::
     BG.CUInt
  -> BG.FunPtr BG.Void
  -> BG.Ptr BG.Void
  -> IO ()

-- __unique:__ @test_edgecasesnaming_modifiers_Example_Unsafe_widget_create@
hs_bindgen_4ce1977df8bd0ad4 ::
     Named_widget_state
  -> Named_widget_callback
  -> BG.Ptr Named_widget
  -> IO ()
hs_bindgen_4ce1977df8bd0ad4 =
  \x0 ->
    \x1 ->
      \x2 ->
        hs_bindgen_4ce1977df8bd0ad4_base (BG.toFFIType x0) (BG.toFFIType x1) (BG.toFFIType x2)

{-| __C declaration:__ @widget_create@

    __defined at:__ @edge-cases\/naming_modifiers.h 11:8@

    __exported by:__ @edge-cases\/naming_modifiers.h@
-}
ffi_widget_create ::
     Named_widget_state
     -- ^ __C declaration:__ @state@
  -> Named_widget_callback
     -- ^ __C declaration:__ @callback@
  -> IO Named_widget
ffi_widget_create =
  \state0 ->
    \callback1 ->
      BG.allocaAndPeek (\res2 ->
                          hs_bindgen_4ce1977df8bd0ad4 state0 callback1 res2)
