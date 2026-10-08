-- | Configure candidate names before validation and collision checks.
module HsBindgen.Config.Naming (
    NamingStrategy (..),
    NameTransform (..),
    NameCase (..),
    applyNameTransform,
) where

import Data.Char qualified as Char
import Data.Text qualified as Text

import HsBindgen.Config.Prelims (FieldNamingStrategy)
import HsBindgen.Imports

-- | Select the case of underscore-separated name words.
data NameCase = PreserveCase | PascalCase | CamelCase
    deriving stock (Eq, Show, Read, Generic)

instance Default NameCase where
    def = PreserveCase

{- | Convert name words, then add a prefix. PreserveCase ignores word replacements.
Word replacement keys match without case distinctions. The first match wins.
-}
data NameTransform = NameTransform
    { prefix :: Text
    , nameCase :: NameCase
    , wordReplacements :: [(Text, Text)]
    }
    deriving stock (Eq, Show, Read, Generic)

instance Default NameTransform where
    def = NameTransform "" PreserveCase []

{- | Configure field prefixes and each category of generated names.
Explicit type names in binding specifications take precedence over typeNames.
Auxiliary type names use the transformed parent type name.
-}
data NamingStrategy = NamingStrategy
    { fieldNamingStrategy :: FieldNamingStrategy
    , typeNames :: NameTransform
    , functionNames :: NameTransform
    , constructorNames :: NameTransform
    , fieldNames :: NameTransform
    , enumConstantNames :: NameTransform
    }
    deriving stock (Eq, Show, Generic)
    deriving anyclass (Default)

-- | Apply case conversion and word replacements before adding the prefix.
applyNameTransform :: NameTransform -> Text -> Text
applyNameTransform transform input = transform.prefix <> converted
  where
    converted :: Text
    converted = case transform.nameCase of
        PreserveCase -> input
        PascalCase -> leading <> convertedWords
        CamelCase -> leading <> modifyFirst Char.toLower convertedWords

    leading, body, convertedWords :: Text
    (leading, body) = Text.span (== '_') input
    convertedWords = Text.concat $ map convertWord $ Text.splitOn "_" body

    convertWord :: Text -> Text
    convertWord word = case lookup (Text.toCaseFold word) replacements of
        Just replacement -> replacement
        Nothing ->
            modifyFirst Char.toUpper $
                if Text.all Char.isUpper word then Text.toLower word else word

    replacements :: [(Text, Text)]
    replacements = [(Text.toCaseFold word, replacement) | (word, replacement) <- transform.wordReplacements]

    modifyFirst :: (Char -> Char) -> Text -> Text
    modifyFirst f text = case Text.uncons text of
        Nothing -> text
        Just (char, rest) -> Text.cons (f char) rest
