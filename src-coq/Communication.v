(* Default settings (from HsToCoq.Coq.Preamble) *)

Generalizable All Variables.

Unset Implicit Arguments.
Set Maximal Implicit Insertion.
Unset Strict Implicit.
Unset Printing Implicit Defensive.

Require Coq.Program.Tactics.
Require Coq.Program.Wf.

(* Converted imports: *)

Require Data.ByteString.
Require Data.ByteString.Internal.
Require GHC.Base.
Require GHC.Maybe.
Require GHC.Num.
Require Types.
Import GHC.Num.Notations.

(* No type declarations to convert. *)

(* Converted value declarations: *)

Definition op_zizpzp__
   : Data.ByteString.Internal.ByteString ->
     Data.ByteString.Internal.ByteString -> Data.ByteString.Internal.ByteString :=
  Data.ByteString.append.

Notation "'_.++_'" := (op_zizpzp__).

Infix ".++" := (_.++_) (at level 99).

Definition msgCntSendIncr
   : GHC.Integer.Type.Integer ->
     Types.SecureChannelState -> GHC.Maybe.Maybe Types.SecureChannelState :=
  fun maxCount =>
    Types.lens Types.msgCntSend (fun scs counter =>
                                   let 'Types.SecureChannelState keySendEncr_0__ keyRecvEncr_1__ keySendAuth_2__
                                      keyRecvAuth_3__ msgCntSend_4__ msgCntRecv_5__ := scs in
                                   Types.SecureChannelState keySendEncr_0__ keyRecvEncr_1__ keySendAuth_2__
                                                            keyRecvAuth_3__ counter msgCntRecv_5__) (Types.incrValid
                                                                                                     maxCount).

Definition msgCntRecvCopy
   : GHC.Integer.Type.Integer ->
     Types.Counter ->
     Types.SecureChannelState -> GHC.Maybe.Maybe Types.SecureChannelState :=
  fun maxCount sendCounter =>
    Types.lens Types.msgCntRecv (fun scs counter =>
                                   let 'Types.SecureChannelState keySendEncr_0__ keyRecvEncr_1__ keySendAuth_2__
                                      keyRecvAuth_3__ msgCntSend_4__ msgCntRecv_5__ := scs in
                                   Types.SecureChannelState keySendEncr_0__ keyRecvEncr_1__ keySendAuth_2__
                                                            keyRecvAuth_3__ msgCntSend_4__ counter) (Types.copyValid
                                                                                                     maxCount
                                                                                                     sendCounter).

Definition initializeSecureChannel'
   : Types.Key -> Types.Role -> Types.SecureChannelState :=
  fun arg_0__ arg_1__ =>
    match arg_0__, arg_1__ with
    | k, Types.Bob =>
        Types.SecureChannelState k k k k (Types.Counter #0) (Types.Counter #0)
    | k, Types.Alice =>
        Types.SecureChannelState k k k k (Types.Counter #0) (Types.Counter #0)
    end.

Definition initializeSecureChannel
   : Types.Key -> Types.Role -> GHC.Maybe.Maybe Types.SecureChannelState :=
  fun k role =>
    GHC.Base.liftM2 initializeSecureChannel' (Types.validKey256 k) (GHC.Maybe.Just
                                                                    role).

Module Notations.
Notation "'_Communication..++_'" := (op_zizpzp__).
Infix "Communication..++" := (_.++_) (at level 99).
End Notations.

(* External variables:
     Data.ByteString.append Data.ByteString.Internal.ByteString GHC.Base.liftM2
     GHC.Integer.Type.Integer GHC.Maybe.Just GHC.Maybe.Maybe GHC.Num.fromInteger
     Types.Alice Types.Bob Types.Counter Types.Key Types.Role
     Types.SecureChannelState Types.copyValid Types.incrValid Types.lens
     Types.msgCntRecv Types.msgCntSend Types.validKey256
*)
