(** Expose an Irmin store as a 9p filesystem. *)

(** The signature of an Irmin9p server. *)
module type S = sig

  type repo
  (** The type for repositories. *)

  val create: string Irmin.Task.f -> repo -> Vfs.Dir.t
  (** [create task repo] is the root directory of the filesystem for
      the Irmin repository [repo]. [task] is used to create
      timestamped commit messages for changes. *)

end

module Make (Store : I9p_tree.STORE): S with type repo = Store.Repo.t
