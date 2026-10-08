{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}

module Example
    ( Example.Named_widget(..)
    , Example.Named_widget_state(..)
    , pattern Example.Value_WIDGET_READY
    , pattern Example.Value_WIDGET_DONE
    , Example.Named_widget_callback_Aux(..)
    , Example.Named_widget_callback(..)
    )
  where

import qualified HsBindgen.Runtime.CEnum as CEnum
import qualified HsBindgen.Runtime.HasCField as HasCField
import qualified HsBindgen.Runtime.Marshal as Marshal
import qualified HsBindgen.Runtime.Struct as Struct
import qualified HsBindgen.Runtime.Support as BG
import qualified HsBindgen.Runtime.Support.CompatHasField as BG.CompatHasField
import Prelude ((<*>), Eq, IO, Int, Ord, Read, Show, fmap, pure, type (~))

{-| __C declaration:__ @struct widget@

    __defined at:__ @edge-cases\/naming_modifiers.h 1:9@

    __exported by:__ @edge-cases\/naming_modifiers.h@
-}
data Named_widget = Mk_Named_widget
  { field_Named_widget_count :: BG.CInt
    {- ^ __C declaration:__ @count@

         __defined at:__ @edge-cases\/naming_modifiers.h 2:7@

         __exported by:__ @edge-cases\/naming_modifiers.h@
    -}
  }
  deriving stock (Eq, BG.Generic, Show)

instance Marshal.StaticSize Named_widget where

  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw Named_widget where

  readRaw =
    \ptr0 ->
          pure Mk_Named_widget
      <*> HasCField.readRaw (BG.Proxy @"field_Named_widget_count") ptr0

instance Marshal.WriteRaw Named_widget where

  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mk_Named_widget field_Named_widget_count2 ->
            HasCField.writeRaw (BG.Proxy @"field_Named_widget_count") ptr0 field_Named_widget_count2

deriving via Marshal.EquivStorable Named_widget instance BG.Storable Named_widget

deriving via Struct.IsStructViaReadRaw Named_widget instance Struct.IsStruct Named_widget

{-| __C declaration:__ @count@

    __defined at:__ @edge-cases\/naming_modifiers.h 2:7@

    __exported by:__ @edge-cases\/naming_modifiers.h@
-}
instance ( ty ~ BG.CInt
         ) => BG.CompatHasField.HasField "field_Named_widget_count" Named_widget ty where

  hasField =
    \x0 ->
      ( \y1 ->
          Mk_Named_widget {field_Named_widget_count = y1}
      , BG.getField @"field_Named_widget_count" x0
      )

instance ( ty ~ BG.CInt
         ) => BG.HasField "field_Named_widget_count" (BG.Ptr Named_widget) (BG.Ptr ty) where

  getField =
    HasCField.fromPtr (BG.Proxy @"field_Named_widget_count")

instance HasCField.HasCField Named_widget "field_Named_widget_count" where

  type CFieldType Named_widget "field_Named_widget_count" =
    BG.CInt

  offset# = \_ -> \_ -> 0

{-| __C declaration:__ @enum widget_state@

    __defined at:__ @edge-cases\/naming_modifiers.h 5:9@

    __exported by:__ @edge-cases\/naming_modifiers.h@
-}
newtype Named_widget_state = Mk_Named_widget_state
  { field_unwrapNamed_widget_state :: BG.CUInt
  }
  deriving stock (Eq, BG.Generic, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize Named_widget_state where

  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw Named_widget_state where

  readRaw =
    \ptr0 ->
          pure Mk_Named_widget_state
      <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw Named_widget_state where

  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mk_Named_widget_state field_unwrapNamed_widget_state2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) field_unwrapNamed_widget_state2

deriving via Marshal.EquivStorable Named_widget_state instance BG.Storable Named_widget_state

deriving via BG.CUInt instance BG.Prim Named_widget_state

instance CEnum.CEnum Named_widget_state where

  type CEnumZ Named_widget_state = BG.CUInt

  toCEnum = Mk_Named_widget_state

  fromCEnum =
    BG.getField @"field_unwrapNamed_widget_state"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList [(0, BG.singleton "Value_WIDGET_READY"), (1, BG.singleton "Value_WIDGET_DONE")]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "Mk_Named_widget_state"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "Mk_Named_widget_state"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum Named_widget_state where

  minDeclaredValue = Value_WIDGET_READY

  maxDeclaredValue = Value_WIDGET_DONE

instance Show Named_widget_state where

  showsPrec = CEnum.shows

instance Read Named_widget_state where

  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance ( ty ~ BG.CUInt
         ) => BG.CompatHasField.HasField "field_unwrapNamed_widget_state" Named_widget_state ty where

  hasField =
    \x0 ->
      ( \y1 ->
          Mk_Named_widget_state {field_unwrapNamed_widget_state = y1}
      , BG.getField @"field_unwrapNamed_widget_state" x0
      )

instance ( ty ~ BG.CUInt
         ) => BG.HasField "field_unwrapNamed_widget_state" (BG.Ptr Named_widget_state) (BG.Ptr ty) where

  getField =
    HasCField.fromPtr (BG.Proxy @"field_unwrapNamed_widget_state")

instance HasCField.HasCField Named_widget_state "field_unwrapNamed_widget_state" where

  type CFieldType Named_widget_state "field_unwrapNamed_widget_state" =
    BG.CUInt

  offset# = \_ -> \_ -> 0

{-| __C declaration:__ @WIDGET_READY@

    __defined at:__ @edge-cases\/naming_modifiers.h 6:3@

    __exported by:__ @edge-cases\/naming_modifiers.h@
-}
pattern Value_WIDGET_READY :: Named_widget_state
pattern Value_WIDGET_READY = Mk_Named_widget_state 0

{-| __C declaration:__ @WIDGET_DONE@

    __defined at:__ @edge-cases\/naming_modifiers.h 7:3@

    __exported by:__ @edge-cases\/naming_modifiers.h@
-}
pattern Value_WIDGET_DONE :: Named_widget_state
pattern Value_WIDGET_DONE = Mk_Named_widget_state 1

{-| Auxiliary type used by 'Named_widget_callback'

    __C declaration:__ @widget_callback@

    __defined at:__ @edge-cases\/naming_modifiers.h 10:16@

    __exported by:__ @edge-cases\/naming_modifiers.h@
-}
newtype Named_widget_callback_Aux = Mk_Named_widget_callback_Aux
  { field_unwrapNamed_widget_callback_Aux :: BG.Ptr Named_widget -> IO ()
  }
  deriving stock (BG.Generic)

-- __unique:__ @toNamed_widget_callback_Aux@
foreign import ccall safe "wrapper" hs_bindgen_ca4eda5fd77cd3a9_base ::
     (BG.Ptr BG.Void -> IO ())
  -> IO (BG.FunPtr (BG.Ptr BG.Void -> IO ()))

-- __unique:__ @toNamed_widget_callback_Aux@
hs_bindgen_ca4eda5fd77cd3a9 ::
     Named_widget_callback_Aux
  -> IO (BG.FunPtr Named_widget_callback_Aux)
hs_bindgen_ca4eda5fd77cd3a9 =
  \fun0 ->
    fmap BG.castFunPtr (hs_bindgen_ca4eda5fd77cd3a9_base (\x1 ->
                                                            BG.getField @"field_unwrapNamed_widget_callback_Aux" fun0 (BG.fromFFIType x1)))

-- __unique:__ @fromNamed_widget_callback_Aux@
foreign import ccall safe "dynamic" hs_bindgen_08530a3c22de1ce7_base ::
     BG.FunPtr (BG.Ptr BG.Void -> IO ())
  -> BG.Ptr BG.Void -> IO ()

-- __unique:__ @fromNamed_widget_callback_Aux@
hs_bindgen_08530a3c22de1ce7 ::
     BG.FunPtr Named_widget_callback_Aux
  -> Named_widget_callback_Aux
hs_bindgen_08530a3c22de1ce7 =
  \funPtr0 ->
    Mk_Named_widget_callback_Aux (\x1 ->
                                    hs_bindgen_08530a3c22de1ce7_base (BG.castFunPtr funPtr0) (BG.toFFIType x1))

instance BG.ToFunPtr Named_widget_callback_Aux where

  toFunPtr = hs_bindgen_ca4eda5fd77cd3a9

instance BG.FromFunPtr Named_widget_callback_Aux where

  fromFunPtr = hs_bindgen_08530a3c22de1ce7

instance ( ty ~ (BG.Ptr Named_widget -> IO ())
         ) => BG.CompatHasField.HasField "field_unwrapNamed_widget_callback_Aux" Named_widget_callback_Aux ty where

  hasField =
    \x0 ->
      ( \y1 ->
          Mk_Named_widget_callback_Aux {field_unwrapNamed_widget_callback_Aux = y1}
      , BG.getField @"field_unwrapNamed_widget_callback_Aux" x0
      )

instance ( ty ~ (BG.Ptr Named_widget -> IO ())
         ) => BG.HasField "field_unwrapNamed_widget_callback_Aux" (BG.Ptr Named_widget_callback_Aux) (BG.Ptr ty) where

  getField =
    HasCField.fromPtr (BG.Proxy @"field_unwrapNamed_widget_callback_Aux")

instance HasCField.HasCField Named_widget_callback_Aux "field_unwrapNamed_widget_callback_Aux" where

  type CFieldType Named_widget_callback_Aux "field_unwrapNamed_widget_callback_Aux" =
    BG.Ptr Named_widget -> IO ()

  offset# = \_ -> \_ -> 0

{-| __C declaration:__ @widget_callback@

    __defined at:__ @edge-cases\/naming_modifiers.h 10:16@

    __exported by:__ @edge-cases\/naming_modifiers.h@
-}
newtype Named_widget_callback = Mk_Named_widget_callback
  { field_unwrapNamed_widget_callback :: BG.FunPtr Named_widget_callback_Aux
  }
  deriving stock (Eq, BG.Generic, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , BG.Storable
    , Marshal.WriteRaw
    )

instance ( ty ~ BG.FunPtr Named_widget_callback_Aux
         ) => BG.CompatHasField.HasField "field_unwrapNamed_widget_callback" Named_widget_callback ty where

  hasField =
    \x0 ->
      ( \y1 ->
          Mk_Named_widget_callback {field_unwrapNamed_widget_callback = y1}
      , BG.getField @"field_unwrapNamed_widget_callback" x0
      )

instance ( ty ~ BG.FunPtr Named_widget_callback_Aux
         ) => BG.HasField "field_unwrapNamed_widget_callback" (BG.Ptr Named_widget_callback) (BG.Ptr ty) where

  getField =
    HasCField.fromPtr (BG.Proxy @"field_unwrapNamed_widget_callback")

instance HasCField.HasCField Named_widget_callback "field_unwrapNamed_widget_callback" where

  type CFieldType Named_widget_callback "field_unwrapNamed_widget_callback" =
    BG.FunPtr Named_widget_callback_Aux

  offset# = \_ -> \_ -> 0
