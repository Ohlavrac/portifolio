String verifyWindowIcon(String windowTitle) {
  switch (windowTitle) {
    case "informations_title":
      return "./assets/icons/my-computer-icon-3.png";
    case "send_email_title":
      return "./assets/icons/email-icon.png";
    case "social_title":
      return "./assets/icons/msn-icon.png";
    case "my_network_title":
      return "./assets/icons/my-network-icon-2.png";
    case "spotify_title":
      return "./assets/icons/song-icon.png";
    case "warning_title":
      return "./assets/icons/warning-icon.png";
    case "sending_email":
      return "./assets/icons/email-icon.png";
    case "email_sent":
      return "./assets/icons/email-icon.png";
    default:
      return "";
  }
}