# Create memberships for the distinct set of all team members who aren't admins.
resource "github_repository" "repositories" {
  for_each = setunion(
    local._archived_repositories,
    local.apex_repositories,
    local.apriltag_repositories,
    local.async_web_server_cpp_repositories,
    local.autoware_repositories,
    local.behaviortree_repositories,
    local.bno055_repositories,
    local.connextdds_repositories,
    local.control_box_rst_repositories,
    local.control_repositories,
    local.cyberbotics_repositories,
    local.cyclonedds_repositories,
    local.diagnostics_repositories,
    local.fastcdr_repositories,
    local.fmi_repositories,
    local.gazebo_repositories,
    local.geographic_info_repositories,
    local.grbl_repositories,
    local.gurumdds_repositories,
    local.ifm3d_repositories,
    local.lgsvl_repositories,
    local.libg2o_repositories,
    local.locator_ros_bridge_repositories,
    local.message_filters_repositories,
    local.mrpt2_repositories,
    local.navigation_repositories,
    local.nmea_repositories,
    local.nodl_repositories,
    local.object_analytics_repositories,
    local.octomap_repositories,
    local.ouster_drivers_repositories,
    local.perception_repositories,
    local.rclc_repositories,
    local.rcpputils_repositories,
    local.realsense_repositories,
    local.rmf_repositories,
    local.roboception_repositories,
    local.robotwebtools_repositories,
    local.ros_canopen_repositories,
    local.rosauth_repositories,
    local.rosbag2_repositories,
    local.swri_repositories,
    local.system_modes_repositories,
    local.tooling_wg_repositories,
    local.tracing_repositories,
    local.transport_drivers_repositories,
    local.ublox_repositories,
    local.udp_msgs_repositories,
    local.urg_repositories,
    local.v4l2_camera_repositories,
    local.vision_msgs_repositories,
    local.xacro_repositories,
  )

  name = each.value
  archived = contains(local._archived_repositories, each.value)
  visibility = "public"
  lifecycle {
    # Plans that destroy repository releases will delete the repository on
    # GitHub and that shouldn't be done in the normal course of operation.
    prevent_destroy = true
    # Ignore fields that are not set or managed by this terraform project
    # to prevent unecessary drift.
    ignore_changes = [
      allow_merge_commit,
      description,
      has_downloads,
      has_issues,
      has_wiki,
      vulnerability_alerts
    ]
  }
}