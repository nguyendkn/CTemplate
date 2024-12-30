#pragma once
#include <vector>

namespace SharedKernel::Interfaces {
template<typename T>
class IRepository {
  public:
    virtual ~IRepository() = default;

    virtual std::vector<T> Query(const std::string& name) = 0;
    virtual T Get(const std::string& name) = 0;
    virtual void Set(const std::string& name, T value) = 0;
    virtual void Remove(const std::string& name) = 0;
};
}