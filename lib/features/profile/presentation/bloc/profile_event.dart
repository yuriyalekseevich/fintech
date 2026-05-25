sealed class ProfileEvent {
  const ProfileEvent();
}

final class ProfileLoadRequested extends ProfileEvent {
  const ProfileLoadRequested();
}

final class ProfileLogoutRequested extends ProfileEvent {
  const ProfileLogoutRequested();
}
