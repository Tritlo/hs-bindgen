{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_HADDOCK prune #-}

module Example.FunPtr
    ( Example.FunPtr.ffi_widget_create
    )
  where

import qualified HsBindgen.Runtime.Support as BG
import qualified HsBindgen.Runtime.Support.CAPI
import Example
import Prelude (IO, fmap)

$(HsBindgen.Runtime.Support.CAPI.addCSource (HsBindgen.Runtime.Support.CAPI.unlines
  [ "#include <edge-cases/naming_modifiers.h>"
  , "/* test_edgecasesnaming_modifiers_Example_get_widget_create */"
  , "__attribute__ ((const))"
  , "widget (*hs_bindgen_5aa2405afc3f9fa8 (void)) ("
  , "  widget_state arg1,"
  , "  widget_callback arg2"
  , ")"
  , "{"
  , "  return &widget_create;"
  , "}"
  ]))

-- __unique:__ @test_edgecasesnaming_modifiers_Example_get_widget_create@
foreign import ccall unsafe "hs_bindgen_5aa2405afc3f9fa8" hs_bindgen_5aa2405afc3f9fa8_base ::
     IO (BG.FunPtr BG.Void)

-- __unique:__ @test_edgecasesnaming_modifiers_Example_get_widget_create@
hs_bindgen_5aa2405afc3f9fa8 :: IO (BG.FunPtr (Named_widget_state -> Named_widget_callback -> IO Named_widget))
hs_bindgen_5aa2405afc3f9fa8 =
  fmap BG.fromFFIType hs_bindgen_5aa2405afc3f9fa8_base

{-# NOINLINE ffi_widget_create #-}
{-| __C declaration:__ @widget_create@

    __defined at:__ @edge-cases\/naming_modifiers.h 11:8@

    __exported by:__ @edge-cases\/naming_modifiers.h@
-}
ffi_widget_create :: BG.FunPtr (Named_widget_state -> Named_widget_callback -> IO Named_widget)
ffi_widget_create =
  BG.unsafePerformIO hs_bindgen_5aa2405afc3f9fa8
