-- | Transform candidate names before Haskell validation and collision checks.
module HsBindgen.Config.Naming (
    NamingModifiers (..),
) where

import HsBindgen.Imports

{- | Configure generated names. Explicit type names in binding specifications
take precedence. Auxiliary type names use the transformed parent type name.
-}
data NamingModifiers = NamingModifiers
    { typeNameModifier :: Text -> Text
    -- ^ Transform C type names.
    , functionNameModifier :: Text -> Text
    -- ^ Transform C function names.
    , constructorNameModifier :: Text -> Text
    -- ^ Transform constructor names derived from Haskell type names.
    , fieldNameModifier :: Text -> Text
    -- ^ Transform field names after the field prefix strategy is applied.
    , enumConstantNameModifier :: Text -> Text
    -- ^ Transform C enum constant names.
    }
    deriving stock (Generic)

instance Default NamingModifiers where
    def = NamingModifiers id id id id id

instance Show NamingModifiers where
    show _ = "<NamingModifiers>"
