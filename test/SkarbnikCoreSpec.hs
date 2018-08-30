module SkarbnikCoreSpec where

import Test.Hspec
import Test.QuickCheck
import Test.Validity

import SkarbnikCore

spec :: Spec
spec = do
     describe "Input params test" $ do
          it "should print param one" $
            createConfig "inc" "cost" `shouldBe` Config {incomeCsvPath = "inc", costsCsvPath = "cost"}

