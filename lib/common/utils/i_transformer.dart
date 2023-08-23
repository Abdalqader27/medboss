abstract class ITransformer<Model, Entity> {
  ITransformer(this.model);

  final Model model;

  Entity transform();
}
