import qbs

Project {
    minimumQbsVersion: "1.7.1"

    references: [
        "thirdparty",
    ]

    StaticLibrary {
        name: "gildedrose"
        Depends { name: "cpp" }

        files: [
            "GildedRose.cc",
            "GildedRose.h",
        ]

        Export {
            Depends { name: "cpp" }
        }
    }

    Application {
        name: "gildedrose_tests"
        Depends { name: "gildedrose" }
        consoleApplication: true
        Depends { name: "googletest" }

        files: [
            "GildedRoseUnitTests.cc",
        ]
    }

    Application {
        name: "gildedrose_app"
        consoleApplication: true
        Depends { name: "gildedrose" }
        files: [
            "GildedRoseTextTests.cc",
        ]
    }
}
