#include "Logger.h"
#include <iostream>

namespace SharedKernel::Utilities {
    void Logger::LogInfo(const std::string& message) {
        std::cout << "[INFO] " << message << std::endl;
    }

    void Logger::LogError(const std::string& message) {
        std::cout << "[ERROR] " << message << std::endl;
    }
}