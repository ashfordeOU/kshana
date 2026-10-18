from setuptools import setup

package_name = "kshana_trust"

setup(
    name=package_name,
    version="0.38.0",
    packages=[package_name],
    data_files=[
        ("share/ament_index/resource_index/packages", ["resource/" + package_name]),
        ("share/" + package_name, ["package.xml"]),
    ],
    install_requires=["setuptools"],
    zip_safe=True,
    maintainer="Ashforde OÜ",
    maintainer_email="contact@ashforde.org",
    description="Receiver-trust scoring of GNSS fixes on ROS 2 topics (advisory software).",
    license="AGPL-3.0-only",
    tests_require=["pytest"],
    entry_points={"console_scripts": ["trust_node = kshana_trust.trust_node:main"]},
)
