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
Require Data.Functor.
Require GHC.Base.
Require GHC.Maybe.
Require GHC.Num.
Require GHC.Prim.
Require GHC.Real.
Require HsToCoq.Err.
Import Data.Functor.Notations.
Import GHC.Base.Notations.
Import GHC.Num.Notations.

(* Converted type declarations: *)

Inductive Transmission : Type :=
  | Transmission (unTransmission : Data.ByteString.Internal.ByteString)
   : Transmission.

Inductive Role : Type := | Alice : Role | Bob : Role.

Inductive Message : Type := | Message (unMessage : GHC.Base.String) : Message.

Inductive Mac : Type :=
  | Mac (unMac : Data.ByteString.Internal.ByteString) : Mac.

Inductive Key : Type :=
  | Key (unKey : Data.ByteString.Internal.ByteString) : Key.

Inductive IV : Type := | IV (unIV : Data.ByteString.Internal.ByteString) : IV.

Inductive HashedValue : Type :=
  | HashedValue (unHashedValue : Data.ByteString.Internal.ByteString)
   : HashedValue.

Inductive Datum : Type := | Datum (unDatum : GHC.Base.String) : Datum.

Inductive Counter : Type := | Counter (unCounter : GHC.Word.Word8) : Counter.

Inductive SecureChannelState : Type :=
  | SecureChannelState (keySendEncr : Key) (keyRecvEncr : Key) (keySendAuth : Key)
  (keyRecvAuth : Key) (msgCntSend : Counter) (msgCntRecv : Counter)
   : SecureChannelState.

Instance Default__Transmission : HsToCoq.Err.Default Transmission :=
  HsToCoq.Err.Build_Default _ (Transmission HsToCoq.Err.default).

Instance Default__Role : HsToCoq.Err.Default Role :=
  HsToCoq.Err.Build_Default _ Alice.

Instance Default__Message : HsToCoq.Err.Default Message :=
  HsToCoq.Err.Build_Default _ (Message HsToCoq.Err.default).

Instance Default__Mac : HsToCoq.Err.Default Mac :=
  HsToCoq.Err.Build_Default _ (Mac HsToCoq.Err.default).

Instance Default__Key : HsToCoq.Err.Default Key :=
  HsToCoq.Err.Build_Default _ (Key HsToCoq.Err.default).

Instance Default__IV : HsToCoq.Err.Default IV :=
  HsToCoq.Err.Build_Default _ (IV HsToCoq.Err.default).

Instance Default__HashedValue : HsToCoq.Err.Default HashedValue :=
  HsToCoq.Err.Build_Default _ (HashedValue HsToCoq.Err.default).

Instance Default__Datum : HsToCoq.Err.Default Datum :=
  HsToCoq.Err.Build_Default _ (Datum HsToCoq.Err.default).

Instance Default__Counter : HsToCoq.Err.Default Counter :=
  HsToCoq.Err.Build_Default _ (Counter HsToCoq.Err.default).

Instance Default__SecureChannelState : HsToCoq.Err.Default SecureChannelState :=
  HsToCoq.Err.Build_Default _ (SecureChannelState HsToCoq.Err.default
                             HsToCoq.Err.default HsToCoq.Err.default HsToCoq.Err.default HsToCoq.Err.default
                             HsToCoq.Err.default).

Definition unTransmission (arg_0__ : Transmission) :=
  let 'Transmission unTransmission := arg_0__ in
  unTransmission.

Definition unMessage (arg_0__ : Message) :=
  let 'Message unMessage := arg_0__ in
  unMessage.

Definition unMac (arg_0__ : Mac) :=
  let 'Mac unMac := arg_0__ in
  unMac.

Definition unKey (arg_0__ : Key) :=
  let 'Key unKey := arg_0__ in
  unKey.

Definition unIV (arg_0__ : IV) :=
  let 'IV unIV := arg_0__ in
  unIV.

Definition unHashedValue (arg_0__ : HashedValue) :=
  let 'HashedValue unHashedValue := arg_0__ in
  unHashedValue.

Definition unDatum (arg_0__ : Datum) :=
  let 'Datum unDatum := arg_0__ in
  unDatum.

Definition unCounter (arg_0__ : Counter) :=
  let 'Counter unCounter := arg_0__ in
  unCounter.

Definition keyRecvAuth (arg_0__ : SecureChannelState) :=
  let 'SecureChannelState _ _ _ keyRecvAuth _ _ := arg_0__ in
  keyRecvAuth.

Definition keyRecvEncr (arg_0__ : SecureChannelState) :=
  let 'SecureChannelState _ keyRecvEncr _ _ _ _ := arg_0__ in
  keyRecvEncr.

Definition keySendAuth (arg_0__ : SecureChannelState) :=
  let 'SecureChannelState _ _ keySendAuth _ _ _ := arg_0__ in
  keySendAuth.

Definition keySendEncr (arg_0__ : SecureChannelState) :=
  let 'SecureChannelState keySendEncr _ _ _ _ _ := arg_0__ in
  keySendEncr.

Definition msgCntRecv (arg_0__ : SecureChannelState) :=
  let 'SecureChannelState _ _ _ _ _ msgCntRecv := arg_0__ in
  msgCntRecv.

Definition msgCntSend (arg_0__ : SecureChannelState) :=
  let 'SecureChannelState _ _ _ _ msgCntSend _ := arg_0__ in
  msgCntSend.

(* Converted value declarations: *)

Local Definition Eq___Key_op_zeze__ : Key -> Key -> bool :=
  GHC.Prim.coerce (_GHC.Base.==_) : Key -> Key -> bool.

Local Definition Eq___Key_op_zsze__ : Key -> Key -> bool :=
  GHC.Prim.coerce (_GHC.Base./=_) : Key -> Key -> bool.

Program Instance Eq___Key : GHC.Base.Eq_ Key :=
  fun _ k__ =>
    k__ {| GHC.Base.op_zeze____ := Eq___Key_op_zeze__ ;
           GHC.Base.op_zsze____ := Eq___Key_op_zsze__ |}.

(* Skipping all instances of class `GHC.Show.Show', including
   `Types.Show__Key' *)

Local Definition Eq___Mac_op_zeze__ : Mac -> Mac -> bool :=
  GHC.Prim.coerce (_GHC.Base.==_) : Mac -> Mac -> bool.

Local Definition Eq___Mac_op_zsze__ : Mac -> Mac -> bool :=
  GHC.Prim.coerce (_GHC.Base./=_) : Mac -> Mac -> bool.

Program Instance Eq___Mac : GHC.Base.Eq_ Mac :=
  fun _ k__ =>
    k__ {| GHC.Base.op_zeze____ := Eq___Mac_op_zeze__ ;
           GHC.Base.op_zsze____ := Eq___Mac_op_zsze__ |}.

(* Skipping all instances of class `GHC.Show.Show', including
   `Types.Show__Mac' *)

Local Definition Eq___Role_op_zeze__ : Role -> Role -> bool :=
  fun arg_0__ arg_1__ =>
    match arg_0__, arg_1__ with
    | Alice, Alice => true
    | Bob, Bob => true
    | _, _ => false
    end.

Local Definition Eq___Role_op_zsze__ : Role -> Role -> bool :=
  fun x y => negb (Eq___Role_op_zeze__ x y).

Program Instance Eq___Role : GHC.Base.Eq_ Role :=
  fun _ k__ =>
    k__ {| GHC.Base.op_zeze____ := Eq___Role_op_zeze__ ;
           GHC.Base.op_zsze____ := Eq___Role_op_zsze__ |}.

(* Skipping all instances of class `GHC.Show.Show', including
   `Types.Show__Role' *)

Local Definition Eq___HashedValue_op_zeze__
   : HashedValue -> HashedValue -> bool :=
  GHC.Prim.coerce (_GHC.Base.==_) : HashedValue -> HashedValue -> bool.

Local Definition Eq___HashedValue_op_zsze__
   : HashedValue -> HashedValue -> bool :=
  GHC.Prim.coerce (_GHC.Base./=_) : HashedValue -> HashedValue -> bool.

Program Instance Eq___HashedValue : GHC.Base.Eq_ HashedValue :=
  fun _ k__ =>
    k__ {| GHC.Base.op_zeze____ := Eq___HashedValue_op_zeze__ ;
           GHC.Base.op_zsze____ := Eq___HashedValue_op_zsze__ |}.

(* Skipping all instances of class `GHC.Show.Show', including
   `Types.Show__HashedValue' *)

Local Definition Eq___IV_op_zeze__ : IV -> IV -> bool :=
  GHC.Prim.coerce (_GHC.Base.==_) : IV -> IV -> bool.

Local Definition Eq___IV_op_zsze__ : IV -> IV -> bool :=
  GHC.Prim.coerce (_GHC.Base./=_) : IV -> IV -> bool.

Program Instance Eq___IV : GHC.Base.Eq_ IV :=
  fun _ k__ =>
    k__ {| GHC.Base.op_zeze____ := Eq___IV_op_zeze__ ;
           GHC.Base.op_zsze____ := Eq___IV_op_zsze__ |}.

(* Skipping all instances of class `GHC.Show.Show', including
   `Types.Show__IV' *)

Local Definition Eq___Counter_op_zeze__ : Counter -> Counter -> bool :=
  GHC.Prim.coerce (_GHC.Base.==_) : Counter -> Counter -> bool.

Local Definition Eq___Counter_op_zsze__ : Counter -> Counter -> bool :=
  GHC.Prim.coerce (_GHC.Base./=_) : Counter -> Counter -> bool.

Program Instance Eq___Counter : GHC.Base.Eq_ Counter :=
  fun _ k__ =>
    k__ {| GHC.Base.op_zeze____ := Eq___Counter_op_zeze__ ;
           GHC.Base.op_zsze____ := Eq___Counter_op_zsze__ |}.

(* Skipping all instances of class `GHC.Show.Show', including
   `Types.Show__Counter' *)

Local Definition Ord__Counter_op_zl__ : Counter -> Counter -> bool :=
  GHC.Prim.coerce (_GHC.Base.<_) : Counter -> Counter -> bool.

Local Definition Ord__Counter_op_zlze__ : Counter -> Counter -> bool :=
  GHC.Prim.coerce (_GHC.Base.<=_) : Counter -> Counter -> bool.

Local Definition Ord__Counter_op_zg__ : Counter -> Counter -> bool :=
  GHC.Prim.coerce (_GHC.Base.>_) : Counter -> Counter -> bool.

Local Definition Ord__Counter_op_zgze__ : Counter -> Counter -> bool :=
  GHC.Prim.coerce (_GHC.Base.>=_) : Counter -> Counter -> bool.

Local Definition Ord__Counter_compare : Counter -> Counter -> comparison :=
  GHC.Prim.coerce (GHC.Base.compare) : Counter -> Counter -> comparison.

Local Definition Ord__Counter_max : Counter -> Counter -> Counter :=
  GHC.Prim.coerce (GHC.Base.max) : Counter -> Counter -> Counter.

Local Definition Ord__Counter_min : Counter -> Counter -> Counter :=
  GHC.Prim.coerce (GHC.Base.min) : Counter -> Counter -> Counter.

Program Instance Ord__Counter : GHC.Base.Ord Counter :=
  fun _ k__ =>
    k__ {| GHC.Base.op_zl____ := Ord__Counter_op_zl__ ;
           GHC.Base.op_zlze____ := Ord__Counter_op_zlze__ ;
           GHC.Base.op_zg____ := Ord__Counter_op_zg__ ;
           GHC.Base.op_zgze____ := Ord__Counter_op_zgze__ ;
           GHC.Base.compare__ := Ord__Counter_compare ;
           GHC.Base.max__ := Ord__Counter_max ;
           GHC.Base.min__ := Ord__Counter_min |}.

(* Skipping all instances of class `GHC.Show.Show', including
   `Types.Show__SecureChannelState' *)

Local Definition Eq___Transmission_op_zeze__
   : Transmission -> Transmission -> bool :=
  GHC.Prim.coerce (_GHC.Base.==_) : Transmission -> Transmission -> bool.

Local Definition Eq___Transmission_op_zsze__
   : Transmission -> Transmission -> bool :=
  GHC.Prim.coerce (_GHC.Base./=_) : Transmission -> Transmission -> bool.

Program Instance Eq___Transmission : GHC.Base.Eq_ Transmission :=
  fun _ k__ =>
    k__ {| GHC.Base.op_zeze____ := Eq___Transmission_op_zeze__ ;
           GHC.Base.op_zsze____ := Eq___Transmission_op_zsze__ |}.

(* Skipping all instances of class `GHC.Show.Show', including
   `Types.Show__Transmission' *)

Local Definition Eq___Message_op_zeze__ : Message -> Message -> bool :=
  GHC.Prim.coerce (_GHC.Base.==_) : Message -> Message -> bool.

Local Definition Eq___Message_op_zsze__ : Message -> Message -> bool :=
  GHC.Prim.coerce (_GHC.Base./=_) : Message -> Message -> bool.

Program Instance Eq___Message : GHC.Base.Eq_ Message :=
  fun _ k__ =>
    k__ {| GHC.Base.op_zeze____ := Eq___Message_op_zeze__ ;
           GHC.Base.op_zsze____ := Eq___Message_op_zsze__ |}.

(* Skipping all instances of class `GHC.Show.Show', including
   `Types.Show__Message' *)

Local Definition Eq___Datum_op_zeze__ : Datum -> Datum -> bool :=
  GHC.Prim.coerce (_GHC.Base.==_) : Datum -> Datum -> bool.

Local Definition Eq___Datum_op_zsze__ : Datum -> Datum -> bool :=
  GHC.Prim.coerce (_GHC.Base./=_) : Datum -> Datum -> bool.

Program Instance Eq___Datum : GHC.Base.Eq_ Datum :=
  fun _ k__ =>
    k__ {| GHC.Base.op_zeze____ := Eq___Datum_op_zeze__ ;
           GHC.Base.op_zsze____ := Eq___Datum_op_zsze__ |}.

(* Skipping all instances of class `GHC.Show.Show', including
   `Types.Show__Datum' *)

Definition validKey256 : Key -> GHC.Maybe.Maybe Key :=
  fun key =>
    if Data.ByteString.length (unKey key) GHC.Base.>=
       (GHC.Real.div #256 #8 GHC.Num.- #1) : bool
    then GHC.Maybe.Just key else
    GHC.Maybe.Nothing.

Definition keyFromHashedValue : HashedValue -> Key :=
  Key GHC.Base.∘ unHashedValue.

Definition macFromHashedValue : HashedValue -> Mac :=
  Mac GHC.Base.∘ unHashedValue.

Definition incrValid
   : GHC.Integer.Type.Integer -> Counter -> GHC.Maybe.Maybe Counter :=
  fun maxCount counter =>
    if (GHC.Real.toInteger (unCounter counter)) GHC.Base.< maxCount : bool
    then GHC.Maybe.Just (Counter (#1 GHC.Num.+ unCounter counter)) else
    GHC.Maybe.Nothing.

Definition copyValid
   : GHC.Integer.Type.Integer -> Counter -> Counter -> GHC.Maybe.Maybe Counter :=
  fun arg_0__ arg_1__ arg_2__ =>
    match arg_0__, arg_1__, arg_2__ with
    | maxCount, counter, _ =>
        if (GHC.Real.toInteger (unCounter counter)) GHC.Base.< maxCount : bool
        then GHC.Maybe.Just counter else
        GHC.Maybe.Nothing
    end.

Definition lens {f : Type -> Type} {s : Type} {a : Type} `{GHC.Base.Functor f}
   : (s -> a) -> (s -> a -> s) -> (a -> f a) -> s -> f s :=
  fun sa sas afa s => sas s Data.Functor.<$> afa (sa s).

(* External variables:
     Type bool comparison false negb true Data.ByteString.length
     Data.ByteString.Internal.ByteString Data.Functor.op_zlzdzg__ GHC.Base.Eq_
     GHC.Base.Functor GHC.Base.Ord GHC.Base.String GHC.Base.compare
     GHC.Base.compare__ GHC.Base.max GHC.Base.max__ GHC.Base.min GHC.Base.min__
     GHC.Base.op_z2218U__ GHC.Base.op_zeze__ GHC.Base.op_zeze____ GHC.Base.op_zg__
     GHC.Base.op_zg____ GHC.Base.op_zgze__ GHC.Base.op_zgze____ GHC.Base.op_zl__
     GHC.Base.op_zl____ GHC.Base.op_zlze__ GHC.Base.op_zlze____ GHC.Base.op_zsze__
     GHC.Base.op_zsze____ GHC.Integer.Type.Integer GHC.Maybe.Just GHC.Maybe.Maybe
     GHC.Maybe.Nothing GHC.Num.fromInteger GHC.Num.op_zm__ GHC.Num.op_zp__
     GHC.Prim.coerce GHC.Real.div GHC.Real.toInteger GHC.Word.Word8
     HsToCoq.Err.Build_Default HsToCoq.Err.Default HsToCoq.Err.default
*)
