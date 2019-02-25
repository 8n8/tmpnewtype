module Main where

import qualified Crypto.Saltine.Core.Sign as C
import qualified Data.Aeson as J
import qualified Data.Text.Encoding as E
import qualified Data.ByteString.Base64 as B64

main :: IO ()
main = do
   (_, pk) <- C.newKeypair
   print $ J.encode pk

instance J.ToJSON C.PublicKey where
    toJSON (C.PK bs) = J.toJSON $ E.decodeUtf8 $ B64.encode bs  
