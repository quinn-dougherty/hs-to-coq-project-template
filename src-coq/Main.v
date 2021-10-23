(* Default settings (from HsToCoq.Coq.Preamble) *)

Generalizable All Variables.

Unset Implicit Arguments.
Set Maximal Implicit Insertion.
Unset Strict Implicit.
Unset Printing Implicit Defensive.

Require Coq.Program.Tactics.
Require Coq.Program.Wf.

(* Converted imports: *)

Require Communication.
Require Coq.Init.Datatypes.
Require Data.ByteString.
Require GHC.Base.
Require GHC.Enum.
Require GHC.List.
Require GHC.Num.
Require GHC.Real.
Require System.IO.
Require Types.
Import GHC.Base.Notations.
Import GHC.Num.Notations.
Import GHC.Real.Notations.

(* No type declarations to convert. *)

(* Converted value declarations: *)

Definition testchankey' : list GHC.Word.Word8 :=
  (GHC.Base.map GHC.Enum.toEnum (Coq.Init.Datatypes.app (cons #1 (cons #1 (cons #1
                                                                                (cons #1 (cons #1 nil)))))
                                                        (GHC.List.take #27 (GHC.List.repeat #0)))) : list
  GHC.Word.Word8.

Definition testchankey : Types.Key :=
  Types.Key (Data.ByteString.pack testchankey').

Definition main : GHC.Types.IO unit :=
  let scs := Communication.initializeSecureChannel testchankey Types.Alice in
  System.IO.print scs GHC.Base.>>
  System.IO.print (GHC.Base.fmap (Communication.msgCntSendIncr ((#2 GHC.Real.^ #8)
                                                                GHC.Num.-
                                                                #1)) scs).

(* External variables:
     cons list nil unit Communication.initializeSecureChannel
     Communication.msgCntSendIncr Coq.Init.Datatypes.app Data.ByteString.pack
     GHC.Base.fmap GHC.Base.map GHC.Base.op_zgzg__ GHC.Enum.toEnum GHC.List.repeat
     GHC.List.take GHC.Num.fromInteger GHC.Num.op_zm__ GHC.Real.op_zc__ GHC.Types.IO
     GHC.Word.Word8 System.IO.print Types.Alice Types.Key
*)
