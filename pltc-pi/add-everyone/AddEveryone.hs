{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Control.Monad
import qualified Data.ByteString as BS
import qualified Data.List as L
import qualified Data.Vector as V
import qualified GitHub as GH

notMemberOf auth org team = do
  org_mems <- org_memsM
  team_mems <- team_memsM
  return $ (fmap . fmap) GH.fromUserName $ fmap (L.\\) org_mems <*> team_mems
  where
    org_memsM = (fmap . fmap) (map GH.simpleUserLogin . V.toList) $ GH.github auth (GH.membersOfR org GH.FetchAll)
    team_memsM = (fmap . fmap) (map GH.simpleUserLogin . V.toList) $ GH.github auth (GH.listTeamMembersR team GH.TeamMemberRoleAll GH.FetchAll)

main :: IO ()
main = do
  token <- BS.readFile "/home/zfnmxt/.gh_everyone_token"
  let auth = GH.BasicAuth "zfnmxt" token
  to_add <- notMemberOf auth diku_dk everyone
  case to_add of
    Left err -> print err
    Right names -> do
      res <- forM names (\name -> GH.github auth $ GH.addTeamMembershipForR everyone name GH.RoleMember)
      print res
  where
    diku_dk = GH.mkOrganizationName "diku-dk"
    everyone = GH.mkTeamId 4754916
