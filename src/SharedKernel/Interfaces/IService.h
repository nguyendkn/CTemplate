#pragma once

namespace SharedKernel::Interfaces {

class IService {
  public:
    virtual ~IService() = default;
    virtual void Execute() = 0;
};

}