#pragma once
#include <string>

namespace SharedKernel::Utilities {
    class Logger {
      public:
        static void LogInfo(const std::string& message);
        static void LogWarning(const std::string& message);
        static void LogError(const std::string& message);
    };
}
