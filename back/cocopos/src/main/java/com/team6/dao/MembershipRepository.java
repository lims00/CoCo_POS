package com.team6.dao;

import com.team6.entity.Membership;
import java.util.List;


public interface MembershipRepository {
    Membership createMembership(Membership membership);
    Membership getByCustomerId(int customerId);
}
