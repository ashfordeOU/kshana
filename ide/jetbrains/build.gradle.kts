import org.jetbrains.intellij.platform.gradle.IntelliJPlatformType

plugins {
    kotlin("jvm") version "2.1.20"
    id("org.jetbrains.intellij.platform") version "2.16.0"
}

group = providers.gradleProperty("pluginGroup").get()
version = providers.gradleProperty("pluginVersion").get()

repositories {
    mavenCentral()
    intellijPlatform {
        defaultRepositories()
    }
}

dependencies {
    intellijPlatform {
        create(
            IntelliJPlatformType.fromCode(providers.gradleProperty("platformType").get()),
            providers.gradleProperty("platformVersion").get(),
        )
    }
    testImplementation("junit:junit:4.13.2")
}

intellijPlatform {
    pluginConfiguration {
        ideaVersion {
            sinceBuild = providers.gradleProperty("pluginSinceBuild")
            untilBuild = provider { null } // open-ended; the plugin verifier checks forward compat
        }
    }

    // Optional developer signing. If these env vars are set, `signPlugin` runs before
    // `publishPlugin` and the IDE shows the plugin as author-verified; if they are
    // absent, publish with `-x signPlugin` and JetBrains Marketplace signs it instead.
    // Both values are the Base64-encoded PEM contents (see submissions/jetbrains-marketplace.md).
    signing {
        certificateChain = providers.environmentVariable("CERTIFICATE_CHAIN")
        privateKey = providers.environmentVariable("PRIVATE_KEY")
        password = providers.environmentVariable("PRIVATE_KEY_PASSWORD")
    }

    // `verifyPlugin` runs the IntelliJ Plugin Verifier against the floor (the since-build) and
    // the newest release line; KSHANA_VERIFY_IDES (comma-separated `TYPE:VERSION`) overrides it.
    pluginVerification {
        ides {
            val wanted = providers.environmentVariable("KSHANA_VERIFY_IDES").orNull
            if (wanted.isNullOrBlank()) {
                create(IntelliJPlatformType.IntellijIdeaCommunity, "2024.3")
            } else {
                wanted.split(',').map { it.trim() }.filter { it.isNotEmpty() }.forEach { spec ->
                    val (type, ver) = spec.split(':', limit = 2)
                    create(IntelliJPlatformType.fromCode(type), ver)
                }
            }
        }
    }

    // `publishPlugin` reads the Marketplace permanent token from PUBLISH_TOKEN.
    publishing {
        token = providers.environmentVariable("PUBLISH_TOKEN")
    }
}

kotlin {
    jvmToolchain(21)
}
