part of test_utils;

ProviderContainer createProviderContainer() {
  final providerContainer = ProviderContainer();
  addTearDown(providerContainer.dispose);
  return providerContainer;
}
